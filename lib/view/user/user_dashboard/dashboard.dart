import 'package:flutter/material.dart';
import 'package:flutter_dev_task/controller/excel_controller/excel_controller.dart';
import 'package:flutter_dev_task/utils/colors/colors.dart';
import 'package:flutter_dev_task/view/user/weather_report/weather_report.dart';
import 'package:get/get.dart';

class UserDashBoard extends StatelessWidget {
  UserDashBoard({super.key});
  final ExcelController excelController = Get.put(ExcelController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: screenContainerbackgroundColor,
      appBar: AppBar(
        backgroundColor: themeColor,
        foregroundColor: cWhite,
        title: const Text(
          "DashBoard",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WeatherReportScreen(),
                  ),
                );
              },
              child: Container(
                width: width * 2 / 4,
                height: width * 2 / 4,
                margin: EdgeInsets.only(
                  bottom: width / 10,
                  left: width / 20,
                  right: width / 20,
                  top: width / 20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: cbluelight, width: 0.3),
                  color:
                      const Color.fromARGB(250, 219, 232, 255).withOpacity(0.4),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: cblack.withOpacity(0.1),
                      blurRadius: 40,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/flaticons/weather.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const Text(
                      'Weather Report',
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                excelController.extractDataFromExcel();
              },
              child: Container(
                width: width * 2 / 4,
                height: width * 2 / 4,
                margin: EdgeInsets.only(
                    bottom: width / 10,
                    left: width / 20,
                    right: width / 20,
                    top: width / 20),
                decoration: BoxDecoration(
                  border: Border.all(color: cbluelight, width: 0.3),
                  color:
                      const Color.fromARGB(250, 219, 232, 255).withOpacity(0.4),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: cblack.withOpacity(0.1),
                      blurRadius: 40,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/flaticons/excel.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const Text(
                      'Upload Excel',
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
