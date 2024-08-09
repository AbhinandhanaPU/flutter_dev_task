import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_task/utils/colors/colors.dart';

class AdminDashBoardScreen extends StatelessWidget {
  const AdminDashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: cWhite,
        title: const Text(
          "DashBoard",
        ),
        backgroundColor: themeColor,
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
                  onCountryChanged: (value) {},
                  onStateChanged: (value) {},
                  onCityChanged: (value) {},
                ),
                actions: [
                  GestureDetector(
                    onTap: () {},
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
                    onTap: () {},
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
          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          decoration: const BoxDecoration(
            color: cblue,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: const Center(
            child: Text(
              'Add Locations',
              style: TextStyle(
                color: cWhite,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
