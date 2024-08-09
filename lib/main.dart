import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_task/firebase_options.dart';
import 'package:flutter_dev_task/utils/colors/colors.dart';
import 'package:flutter_dev_task/view/common_screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const SplashScreen(),
    );
  }
}
