import 'dart:developer';
import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_dev_task/utils/utils/utils.dart';
import 'package:get/get.dart';

class ExcelController extends GetxController {
  final docUID = uuid.v1();
  Future<Excel?> pickExcelForUser() async {
    try {
      FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
        allowMultiple: false,
      );
      if (pickedFile != null) {
        Uint8List? bytes = pickedFile.files.single.bytes;
        if (bytes != null) {
          Excel excel = Excel.decodeBytes(bytes);
          return excel;
        }
      } else {
        showToast(msg: "Excel File Error");
      }
    } catch (e) {
      showToast(msg: "Something went wrong");
      log(e.toString());
      return null;
    }
    return null;
  }

  Future<void> extractDataFromExcel() async {
    try {
      final Excel? result = await pickExcelForUser();
      if (result != null) {
        if (result.tables.isNotEmpty) {
          Sheet? table = result.tables[result.tables.keys.first];
          if (table != null) {
            for (int i = 1; i < table.maxRows; i++) {
              List<Data?>? firstRow = table.rows[i];
              if (firstRow[0]?.value != null &&
                  firstRow[1]?.value != null &&
                  firstRow[2]?.value != null &&
                  firstRow[3]?.value != null) {
                // final Map<String, dynamic> studentModel = {
                //   'docId': docUID,
                //   'country': firstRow[1]?.value.toString() ?? '',
                //   'state': firstRow[2]?.value.toString() ?? '',
                //   'city': firstRow[3]?.value.toString() ?? '',
                // };
                // await server
                //     .collection('Locations')
                //     .doc(docUID)
                //     .set(studentModel)
                //     .then((value) {
                //   showToast(msg: 'Excel Uploaded Successfully');
                // });
              }
            }
          } else {
            showToast(msg: 'Empty Sheet');
          }
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
