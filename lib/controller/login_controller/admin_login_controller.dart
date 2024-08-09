import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_task/utils/firebase/firebase.dart';
import 'package:flutter_dev_task/utils/utils/utils.dart';
import 'package:flutter_dev_task/view/admin/dashboard_screen.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';

class AdminLoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<ButtonState> buttonstate = ButtonState.idle.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  adminLogin(BuildContext context) async {
    try {
      buttonstate.value = ButtonState.loading;
      await serverAuth
          .signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then((value) async {
        final user =
            await server.collection('admin').doc(value.user?.uid).get();

        if (user.data() != null) {
          buttonstate.value = ButtonState.success;
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const AdminDashBoardScreen(),
            ),
            (route) => false,
          );
          emailController.clear();
          passwordController.clear();
        } else {
          buttonstate.value = ButtonState.fail;
          showToast(msg: 'Your are not an Admin. Try Different Login!');
          await Future.delayed(const Duration(seconds: 3)).then((vazlue) {
            buttonstate.value = ButtonState.idle;
          });     
        }
      }).catchError((error) {
        if (error is FirebaseAuthException) {
          buttonstate.value = ButtonState.fail;
          handleFirebaseError(error);
        }
      });
    } catch (e) {
      buttonstate.value = ButtonState.fail;
      showToast(msg: "Sign in failed");
    }
  }
}
