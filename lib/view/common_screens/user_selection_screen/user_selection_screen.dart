import 'package:flutter/material.dart';
import 'package:flutter_dev_task/view/login_section/admin_login.dart';
import 'package:flutter_dev_task/view/login_section/user_login.dart';
import 'package:flutter_dev_task/view/widgets/user_select_container/user_select_container.dart';
import 'package:get/get.dart';

class UserSelectionScreen extends StatelessWidget {
  const UserSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome..',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Select who you are ?',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      2,
                      (int index) {
                        return GestureDetector(
                          onTap: () async {
                            if (index == 0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return UserLogin();
                                  },
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AdminLogin();
                                  },
                                ),
                              );
                            }
                          },
                          child: UserContainer(
                              width: width,
                              imagePath: userIcons[index],
                              imageText: userList[index]),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> userList = [
  'User'.tr,
  'Admin'.tr,
];

var userIcons = [
  'assets/flaticons/user.png',
  'assets/flaticons/admin.png',
];
