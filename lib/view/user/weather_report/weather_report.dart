import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dev_task/controller/weather_controller/weather_controller.dart';
import 'package:flutter_dev_task/model/weather_model/weather_model.dart';
import 'package:flutter_dev_task/utils/colors/colors.dart';
import 'package:flutter_dev_task/utils/utils/utils.dart';
import 'package:get/get.dart';

class WeatherReportScreen extends StatefulWidget {
  const WeatherReportScreen({super.key});

  @override
  State<WeatherReportScreen> createState() => _WeatherReportScreenState();
}

class _WeatherReportScreenState extends State<WeatherReportScreen> {
  final WeathercController weathercController = Get.put(WeathercController());

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  void _fetchWeather() async {
    try {
      await weathercController
          .fetchWeather('IN', 'kerala', 'aluva')
          .then((value) {
        log('Fetching weather data');
        log(weathercController.weatherModel.toString());
      });
    } catch (e) {
      log('Error fetching weather data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final weather = weathercController.weatherModel;
    return Scaffold(
      backgroundColor: screenContainerbackgroundColor,
      appBar: AppBar(
        backgroundColor: themeColor,
        foregroundColor: cWhite,
        title: const Text('Weather Report'),
      ),
      body: weather != null
          ? ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              children: [
                weatherLayout1(weather),
                const SizedBox(height: 20),
                weatherLayout2(weather),
                const SizedBox(height: 20),
                weatherLayout4(weather),
                const SizedBox(height: 20),
                weatherLayout3(weather),
                const SizedBox(height: 20),
                weatherLayout5(weather),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget weatherLayout1(WeatherModel weather) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${weather.name}, ${weather.sys?.country}',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold)),
                  Text('${weather.weather[0].description}',
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
              const Icon(
                Icons.wb_sunny,
                size: 60,
                color: Colors.orangeAccent,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              weatherDetails(
                  Icons.thermostat_outlined, 'Temp', '${weather.main?.temp}°C'),
              weatherDetails(Icons.air, 'Wind', '${weather.wind?.speed} m/s'),
              weatherDetails(
                  Icons.water_drop, 'Humidity', '${weather.main?.humidity}%'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              weatherDetails(
                  Icons.wb_sunny, 'Sunrise', formatTime(weather.sys?.sunrise)),
              weatherDetails(
                  Icons.nights_stay, 'Sunset', formatTime(weather.sys?.sunset)),
            ],
          ),
        ],
      ),
    );
  }

  Widget weatherLayout2(WeatherModel weather) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        decoration: BoxDecoration(
            color: cgreylite.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.cloud_circle_sharp, size: 50, color: cbluelight),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("${weather.name}", style: const TextStyle(fontSize: 20)),
                Text('${weather.main?.temp}°C',
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget weatherLayout3(WeatherModel weather) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.wb_sunny, size: 50, color: Colors.orange),
            title:
                Text('${weather.name}', style: const TextStyle(fontSize: 20)),
            subtitle:
                Text('${weather.main?.temp}°C, ${weather.weather[0].main}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Icon(Icons.thermostat, color: Colors.red),
                    Text('High: ${weather.main?.tempMax}°C'),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.thermostat_outlined, color: Colors.blue),
                    Text('Low: ${weather.main?.tempMin}°C'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget weatherLayout4(WeatherModel weather) {
    return Column(
      children: [
        Text('${weather.name}', style: const TextStyle(fontSize: 22)),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 70,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.wb_cloudy, size: 40, color: Colors.white),
                    Text("${weather.weather[0].description}",
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 70,
                color: Colors.yellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${weather.main?.temp}°C',
                        style: const TextStyle(fontSize: 28)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget weatherLayout5(WeatherModel weather) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
          'https://img.freepik.com/premium-vector/sky-clouds-design-with-flat-cartoon-poster-flyers-postcards-web-banners_771576-58.jpg',
          height: 300,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            Text('${weather.name}',
                style: const TextStyle(fontSize: 22, color: Colors.white)),
            Text('${weather.main?.temp}°C, ${weather.weather[0].main}',
                style: const TextStyle(fontSize: 18, color: Colors.white)),
          ],
        ),
      ],
    );
  }

  Widget weatherDetails(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, size: 30, color: themeColor),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 5),
        Text(value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
