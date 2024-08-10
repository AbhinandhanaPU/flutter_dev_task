import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_task/controller/location_controller/location_controller.dart';
import 'package:flutter_dev_task/utils/colors/colors.dart';
import 'package:flutter_dev_task/utils/firebase/firebase.dart';
import 'package:flutter_dev_task/utils/utils/utils.dart';
import 'package:flutter_dev_task/view/widgets/location_widget/location_widget.dart';
import 'package:get/get.dart';

class AdminDashBoardScreen extends StatelessWidget {
  AdminDashBoardScreen({super.key});

  final locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: cWhite,
        title: const Text("Dashboard"),
        backgroundColor: themeColor,
      ),
      body: StreamBuilder(
        stream: server.collection('Locations').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No locations added yet!'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final data = snapshot.data!.docs[index].data();
              return LocationCard(
                country: data['country'],
                state: data['state'],
                city: data['city'],
              );
            },
          );
        },
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                insetPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 40,
                ),
                shape: const BeveledRectangleBorder(),
                actionsAlignment: MainAxisAlignment.spaceBetween,
                title: SelectState(
                  onCountryChanged: (value) {
                    locationController.countryValue.value = value;
                  },
                  onStateChanged: (value) {
                    locationController.stateValue.value = value;
                  },
                  onCityChanged: (value) {
                    locationController.cityValue.value = value;
                  },
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: themeColor,
                      ),
                      child: const Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: cWhite,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (locationController.countryValue.value.isNotEmpty &&
                          locationController.stateValue.value.isNotEmpty &&
                          locationController.cityValue.value.isNotEmpty) {
                        locationController.addLocationToDB();
                      } else {
                        showToast(msg: 'Choose all values');
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: themeColor,
                      ),
                      child: const Center(
                        child: Text(
                          'Add Location',
                          style: TextStyle(
                              color: cWhite,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          height: 60,
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          decoration: const BoxDecoration(
            color: cblue,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Add Locations',
                style: TextStyle(
                  color: cWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.location_on_outlined,
                color: cWhite,
              )
            ],
          ),
        ),
      ),
    );
  }
}
