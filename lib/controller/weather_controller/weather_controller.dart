import 'dart:convert';

import 'package:flutter_dev_task/model/weather_model/weather_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WeathercController extends GetxController {
  final String apiKey = '168671ad04e5555202104dd795d17064';
  Map<String, dynamic> decodedData = {};
  WeatherModel? weatherModel;
  RxBool isLoading = false.obs;

  Future fetchWeather(String country, String state, String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city,$state,$country&appid=$apiKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      weatherModel = WeatherModel.fromJson(decodedData);
    } else {
      throw Exception('Failed to fetch weather data');
    }
    return null;
  }
}
