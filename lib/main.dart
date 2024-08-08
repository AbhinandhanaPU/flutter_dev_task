import 'package:flutter/material.dart';
import 'package:flutter_dev_task/utils/colors/colors.dart';
import 'package:flutter_dev_task/view/admin/dashboard_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: cWhite,
          labelColor: Colors.blue[100],
          indicatorColor: Colors.green,
        ),
        appBarTheme: const AppBarTheme(foregroundColor: cWhite),
      ),
      home: const AdminDashBoardScreen(),
    );
  }
}
