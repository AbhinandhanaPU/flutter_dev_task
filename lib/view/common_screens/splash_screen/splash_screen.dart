import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dev_task/view/common_screens/user_selection_screen/user_selection_screen.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const UserSelectionScreen(),
        ),
      );
    }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: AnimationConfiguration.staggeredGrid(
                position: 1,
                duration: const Duration(milliseconds: 4000),
                columnCount: 3,
                child: ScaleAnimation(
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: FadeInAnimation(
                    child: Container(
                      height: 220,
                      width: 220,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(
                          'assets/images/login.webp',
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            ),
            const Center(
              child: AnimationConfiguration.staggeredGrid(
                position: 2,
                duration: Duration(milliseconds: 4000),
                columnCount: 3,
                child: ScaleAnimation(
                  duration: Duration(milliseconds: 900),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: FadeInAnimation(
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 230, 18, 3),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
