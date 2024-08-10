import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dev_task/model/weather_model/weather_model.dart';
import 'package:flutter_dev_task/utils/firebase/firebase.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WeathercController extends GetxController {
  final String apiKey = '168671ad04e5555202104dd795d17064';
  Rx<WeatherModel?> weatherModel = Rx<WeatherModel?>(null);
  RxBool isLoading = false.obs;

  Future<void> fetchWeatherForLocations() async {
    isLoading.value = true;
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await server
          .collection('User')
          .doc(serverAuth.currentUser!.uid)
          .collection('locations')
          .get();

      for (var doc in snapshot.docs) {
        final data = doc.data();
        final country = data['country'];
        final state = data['state'];
        final city = data['city'];

        final url =
            'https://api.openweathermap.org/data/2.5/weather?q=$city,$state,$country&appid=$apiKey';

        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          Map<String, dynamic> decodedData = jsonDecode(response.body);
          weatherModel.value = WeatherModel.fromJson(decodedData);
          log('Weather data for $city, $state, $country fetched successfully.');
        } else {
          log('Failed to fetch weather data for $city, $state, $country');
          weatherModel.value = null;
        }
      }
    } catch (e) {
      weatherModel.value = null;
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
