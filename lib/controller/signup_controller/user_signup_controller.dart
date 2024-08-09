import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_task/utils/utils/utils.dart';
import 'package:flutter_dev_task/view/admin/dashboard_screen.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';

class UserSignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  Rx<ButtonState> buttonstate = ButtonState.idle.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  clearFields() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  createUser(BuildContext context) async {
    try {
      buttonstate.value = ButtonState.loading;
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((authvalue) async {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(authvalue.user!.uid)
            .set({
          'userName': nameController.text,
          'emailId': emailController.text,
          'password': passwordController.text,
          'userRole': 'user'
        }).then((value) async {
          buttonstate.value = ButtonState.success;
          await Future.delayed(const Duration(seconds: 2)).then((vazlue) {
            buttonstate.value = ButtonState.idle;
            clearFields();
            return showDialog(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Message'),
                  content: const SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text('Your Profile Created Successfully ')
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Ok'),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (context) {
                            return const AdminDashBoardScreen();
                          },
                        ), (route) => false);
                      },
                    ),
                  ],
                );
              },
            );
          });
        });
      });
    } on FirebaseAuthException catch (e) {
      showToast(msg: e.code);
      buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
    } catch (e) {
      log(e.toString());
      showToast(msg: 'Somthing went wrong please try again');
      buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
    }
  }
}
