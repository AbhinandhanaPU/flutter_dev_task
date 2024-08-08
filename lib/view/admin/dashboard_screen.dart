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
    );
  }
}
