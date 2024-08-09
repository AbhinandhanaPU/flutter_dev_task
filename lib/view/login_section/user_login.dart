import 'package:flutter/material.dart';
import 'package:flutter_dev_task/controller/login_controller/user_login_controller.dart';
import 'package:flutter_dev_task/utils/colors/colors.dart';
import 'package:flutter_dev_task/utils/validations/validations.dart';
import 'package:flutter_dev_task/view/signup_section/user_signup_screen.dart';
import 'package:flutter_dev_task/view/widgets/login_text_formfield/login_text_formfield.dart';
import 'package:flutter_dev_task/view/widgets/progess_button/progress_button.dart';
import 'package:get/get.dart';

class UserLogin extends StatelessWidget {
  UserLogin({super.key});
  final UserLoginController userLoginController =
      Get.put(UserLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: cWhite,
        title: const Text(
          "User Login",
        ),
        backgroundColor: themeColor,
      ),
      body: Form(
        key: userLoginController.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 340,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/login.webp'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Text(
                'User Login',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              LoginTextFormfield(
                obscureText: false,
                hintText: 'Email ID'.tr,
                labelText: 'Enter Mail ID',
                prefixIcon: const Icon(Icons.mail_outline),
                textEditingController: userLoginController.emailController,
                validator: checkFieldEmailIsValid,
              ),
              const SizedBox(
                height: 20,
              ),
              LoginTextFormfield(
                hintText: 'Password'.tr,
                labelText: 'Password',
                obscureText: false,
                textEditingController: userLoginController.passwordController,
                validator: checkFieldPasswordIsValid,
                prefixIcon: const Icon(Icons.lock),
              ),
              const SizedBox(
                height: 40,
              ),
              Obx(
                () => ProgressButtonWidget(
                  function: () async {
                    if (userLoginController.formKey.currentState!.validate()) {
                      userLoginController.userLogin(context);
                    }
                  },
                  buttonstate: userLoginController.buttonstate.value,
                  text: 'Login',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have an account?",
                      style: TextStyle(fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserSignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        ' Sign Up',
                        style: TextStyle(
                          fontSize: 19,
                          color: themeColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
