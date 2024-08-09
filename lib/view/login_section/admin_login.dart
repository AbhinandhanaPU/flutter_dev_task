import 'package:flutter/material.dart';
import 'package:flutter_dev_task/controller/login_controller/admin_login_controller.dart';
import 'package:flutter_dev_task/utils/colors/colors.dart';
import 'package:flutter_dev_task/utils/validations/validations.dart';
import 'package:flutter_dev_task/view/widgets/login_text_formfield/login_text_formfield.dart';
import 'package:flutter_dev_task/view/widgets/progess_button/progress_button.dart';
import 'package:get/get.dart';

class AdminLogin extends StatelessWidget {
  AdminLogin({super.key});
  final AdminLoginController adminLoginController =
      Get.put(AdminLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: cWhite,
        title: const Text(
          "Admin Login",
        ),
        backgroundColor: themeColor,
      ),
      body: Form(
        key: adminLoginController.formKey,
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
                'Admin Login',
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
                textEditingController: adminLoginController.emailController,
                validator: checkFieldEmailIsValid,
              ),
              const SizedBox(
                height: 20,
              ),
              LoginTextFormfield(
                hintText: 'Password'.tr,
                labelText: 'Password',
                obscureText: false,
                textEditingController: adminLoginController.passwordController,
                validator: checkFieldPasswordIsValid,
                prefixIcon: const Icon(Icons.lock),
              ),
              const SizedBox(
                height: 40,
              ),
              Obx(
                () => ProgressButtonWidget(
                  function: () async {
                    if (adminLoginController.formKey.currentState!.validate()) {
                      adminLoginController.adminLogin(context);
                    }
                  },
                  buttonstate: adminLoginController.buttonstate.value,
                  text: 'Login',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
