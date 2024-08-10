import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_dev_task/utils/firebase/firebase.dart';
import 'package:flutter_dev_task/utils/utils/utils.dart';
import 'package:get/get.dart';

class ExcelController extends GetxController {
  Future<Excel?> pickExcelForUser() async {
    try {
      FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
        allowMultiple: false,
      );

      if (pickedFile != null) {
        log('File selected: ${pickedFile.files.single.name}');

        String? filePath = pickedFile.files.single.path;
        if (filePath != null) {
          log('File path: $filePath');
          File file = File(filePath);
          Uint8List bytes = await file.readAsBytes();
          log('File byte length: ${bytes.length}');
          if (bytes.isNotEmpty) {
            Excel excel = Excel.decodeBytes(bytes);
            log('Excel file decoded successfully.');
            return excel;
          } else {
            showToast(msg: "No data found in the selected file.");
            log('File bytes are empty.');
          }
        } else {
          showToast(msg: "Failed to get file path.");
          log('File path is null.');
        }
      } else {
        showToast(msg: "No file selected.");
        log('No file selected by the user.');
      }
    } catch (e) {
      showToast(msg: "Something went wrong while picking the file.");
      log('Error picking file: $e');
    }
    return null;
  }

  Future<void> extractDataFromExcel() async {
    try {
      final Excel? result = await pickExcelForUser();
      if (result != null && result.tables.isNotEmpty) {
        final Sheet? table = result.tables[result.tables.keys.first];
        if (table != null && table.maxRows > 1) {
          for (int i = 1; i < table.maxRows; i++) {
            List<Data?> row = table.rows[i];
            if (row.length >= 3 &&
                row[0]?.value != null &&
                row[1]?.value != null &&
                row[2]?.value != null) {
              final country = row[0]!.value.toString();
              final state = row[1]!.value.toString();
              final city = row[2]!.value.toString();

              log('Extracted Data - Country: $country, State: $state, City: $city');

              final Map<String, dynamic> locations = {
                'country': country,
                'state': state,
                'city': city,
              };

              await server
                  .collection('User')
                  .doc(serverAuth.currentUser!.uid)
                  .collection('locations')
                  .doc('$country-$state-$city')
                  .set(locations)
                  .then((value) {
                showToast(
                  msg: "Location data added for $city, $state, $country",
                );
              });
            } else {
              log('Invalid or missing data in row $i');
              showToast(msg: 'Invalid data in Excel sheet');
            }
          }
        } else {
          showToast(msg: 'The selected sheet is empty or has no data.');
          log('Empty or null sheet.');
        }
      }
    } catch (e) {
      showToast(msg: "An error occurred while processing the Excel file.");
      log('Error extracting data from Excel: $e');
    }
  }
}
