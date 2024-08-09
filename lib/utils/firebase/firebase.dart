import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dev_task/utils/utils/utils.dart';

final server = FirebaseFirestore.instance;
final serverAuth = FirebaseAuth.instance;

void handleFirebaseError(FirebaseAuthException error) {
  switch (error.code) {
    case 'invalid-email':
      showToast(msg: 'invalid-email');
      break;
    case 'user-disabled':
      showToast(msg: 'user-disabled');
      break;
    case 'user-not-found':
      showToast(msg: 'user-not-found');
      break;
    case 'wrong-password':
      showToast(msg: 'wrong-password');
      break;
    case 'invalid-credential':
      showToast(msg: 'Invalid-credential');
      break;

    default:
      showToast(msg: 'Something went wrong');
      break;
  }
}
