import 'dart:developer';

import 'package:flutter_dev_task/utils/firebase/firebase.dart';
import 'package:flutter_dev_task/utils/utils/utils.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  RxString countryValue = ''.obs;
  RxString stateValue = ''.obs;
  RxString cityValue = ''.obs;

  final docUID = uuid.v1();

  addLocationToDB() async {
    try {
      await server.collection('Locations').doc(docUID).set({
        'docId': docUID,
        'country': countryValue.value,
        'state': stateValue.value,
        'city': cityValue.value,
      }).then((value) {
        log('Locations added');
        showToast(msg: 'Locations added');
      });
    } catch (e) {
      log('error adding locatioins to DB $e');
    }
  }
}
