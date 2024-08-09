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
      bottomNavigationBar: Container(
        height: 70,
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
                color: cWhite, fontSize: 20, fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
