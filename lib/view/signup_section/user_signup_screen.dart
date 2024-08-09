import 'package:flutter/material.dart';
import 'package:flutter_dev_task/controller/signup_controller/user_signup_controller.dart';
import 'package:flutter_dev_task/utils/colors/colors.dart';
import 'package:flutter_dev_task/utils/utils/utils.dart';
import 'package:flutter_dev_task/utils/validations/validations.dart';
import 'package:flutter_dev_task/view/login_section/user_login.dart';
import 'package:flutter_dev_task/view/widgets/login_text_formfield/login_text_formfield.dart';
import 'package:flutter_dev_task/view/widgets/progess_button/progress_button.dart';
import 'package:get/get.dart';

class UserSignUpScreen extends StatelessWidget {
  UserSignUpScreen({super.key});
  final userSignUpController = Get.put(UserSignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: cWhite,
        title: const Text("WELCOME"),
        backgroundColor: themeColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/signup.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Form(
                key: userSignUpController.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    LoginTextFormfield(
                      obscureText: false,
                      hintText: 'Name'.tr,
                      labelText: 'Enter NAme',
                      prefixIcon: const Icon(Icons.person_2_outlined),
                      textEditingController:
                          userSignUpController.nameController,
                      validator: checkFieldEmpty,
                    ),
                    LoginTextFormfield(
                      obscureText: false,
                      hintText: 'Email ID'.tr,
                      labelText: 'Enter Mail ID',
                      prefixIcon: const Icon(Icons.mail_outline),
                      textEditingController:
                          userSignUpController.emailController,
                      validator: checkFieldEmailIsValid,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "* Use a valid email".tr,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: themeColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    LoginTextFormfield(
                      hintText: 'Password'.tr,
                      labelText: 'Password',
                      icon: Icons.lock_outline,
                      textEditingController:
                          userSignUpController.passwordController,
                      validator: checkFieldPasswordIsValid,
                      prefixIcon: const Icon(Icons.lock),
                      obscureText: false,
                    ),
                    LoginTextFormfield(
                      hintText: 'Confirm Password'.tr,
                      labelText: 'Confirm Password',
                      icon: Icons.lock,
                      textEditingController:
                          userSignUpController.confirmPasswordController,
                      validator: checkFieldPasswordIsValid,
                      prefixIcon: const Icon(Icons.lock),
                      obscureText: false,
                    ),
                    Obx(
                      () => ProgressButtonWidget(
                        function: () async {
                          if (userSignUpController.formKey.currentState!
                              .validate()) {
                            if (userSignUpController
                                    .confirmPasswordController.text
                                    .trim() ==
                                userSignUpController.passwordController.text
                                    .trim()) {
                              userSignUpController.createUser(context);
                            } else {
                              showToast(msg: "Password Missmatch");
                            }
                          }
                        },
                        buttonstate: userSignUpController.buttonstate.value,
                        text: 'Sign Up',
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?".tr,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return UserLogin();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Login".tr,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 19,
                              color: themeColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
