import 'package:flutter/material.dart';
import 'package:flutter_dev_task/utils/colors/colors.dart';

class WeatherReportScreen extends StatelessWidget {
  const WeatherReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenContainerbackgroundColor,
      appBar: AppBar(
        backgroundColor: themeColor,
        foregroundColor: cWhite,
        title: const Text('Weather Report'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              weatherLayoutOne(),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              weatherLayoutTwo(),
              const SizedBox(
                height: 20,
              ),
              weatherLayoutThree(),
              const SizedBox(
                height: 20,
              ),
              weatherLayoutFour(),
              const SizedBox(
                height: 20,
              ),
              weatherLayoutFive(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget weatherLayoutOne() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
      color: cgreylite.withOpacity(0.1),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.cloud_circle_sharp, size: 50, color: cbluelight),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('New York', style: TextStyle(fontSize: 20)),
              Text('25°C', style: TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget weatherLayoutTwo() {
  return Column(
    children: [
      const Text('Los Angeles', style: TextStyle(fontSize: 22)),
      const SizedBox(height: 10),
      Row(
        children: [
          Expanded(
            child: Container(
              height: 70,
              color: Colors.blue,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wb_cloudy, size: 40, color: Colors.white),
                  Text('Cloudy', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 70,
              color: Colors.yellow,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('22°C', style: TextStyle(fontSize: 28)),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget weatherLayoutThree() {
  return const Card(
    child: Column(
      children: [
        ListTile(
          leading: Icon(Icons.wb_sunny, size: 50, color: Colors.orange),
          title: Text('Chicago', style: TextStyle(fontSize: 20)),
          subtitle: Text('28°C, Sunny'),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.thermostat, color: Colors.red),
                  Text('High: 30°C'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.thermostat_outlined, color: Colors.blue),
                  Text('Low: 18°C'),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget weatherLayoutFour() {
  return Stack(
    alignment: Alignment.center,
    children: [
      Image.network(
        'https://img.freepik.com/premium-vector/sky-clouds-design-with-flat-cartoon-poster-flyers-postcards-web-banners_771576-58.jpg',
        height: 200,
        fit: BoxFit.cover,
      ),
      const Column(
        children: [
          Text('Miami', style: TextStyle(fontSize: 22, color: Colors.white)),
          Text('32°C, Sunny',
              style: TextStyle(fontSize: 18, color: Colors.white)),
        ],
      ),
    ],
  );
}

Widget weatherLayoutFive() {
  return Column(
    children: [
      const Text('Hourly Forecast', style: TextStyle(fontSize: 20)),
      const SizedBox(height: 10),
      GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(8, (index) {
          return const Column(
            children: [
              Text('12:00 PM'),
              Icon(Icons.wb_sunny, color: Colors.orange),
              Text('30°C'),
            ],
          );
        }),
      ),
    ],
  );
}
