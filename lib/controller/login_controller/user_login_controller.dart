import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_task/utils/firebase/firebase.dart';
import 'package:flutter_dev_task/utils/utils/utils.dart';
import 'package:flutter_dev_task/view/admin/dashboard_screen.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';

class UserLoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<ButtonState> buttonstate = ButtonState.idle.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  userLogin(BuildContext context) async {
    try {
      buttonstate.value = ButtonState.loading;
      await serverAuth
          .signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then((value) async {
        final user = await server.collection('User').doc(value.user?.uid).get();

        if (user.data() != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AdminDashBoardScreen();
              },
            ),
          );
          emailController.clear();
          passwordController.clear();
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
