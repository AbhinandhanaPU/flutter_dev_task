import 'package:flutter/material.dart';
import 'package:flutter_dev_task/utils/colors/colors.dart';

class UserContainer extends StatelessWidget {
  const UserContainer({
    super.key,
    required this.width,
    required this.imagePath,
    required this.imageText,
  });
  final double width;
  final String imagePath;
  final String imageText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 2 / 3,
      height: width * 1 / 3,
      margin: EdgeInsets.only(
          bottom: width / 10,
          left: width / 20,
          right: width / 20,
          top: width / 20),
      decoration: BoxDecoration(
        border: Border.all(color: cbluelight, width: 0.3),
        color: const Color.fromARGB(250, 219, 232, 255).withOpacity(0.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: cblack.withOpacity(0.1),
            blurRadius: 40,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            imageText,
            style: const TextStyle(
              letterSpacing: 1,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
