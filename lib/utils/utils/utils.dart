import 'package:flutter_dev_task/utils/colors/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

void showToast({required String msg}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: cblack,
    textColor: cWhite,
    fontSize: 16.0,
  );
}

const uuid = Uuid();
