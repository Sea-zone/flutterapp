import 'package:flutter/material.dart';

class CaroselSliderContents extends StatelessWidget {
  const CaroselSliderContents({
    required this.buttonText,
    required this.description,
    required this.imagePath,
    required this.onClick,
    required this.quote,
    super.key,
  });

  final String imagePath;
  final String quote;
  final String buttonText;
  final String description;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          width: double.infinity,
          height: 400.0,
          fit: BoxFit.cover,
          image: AssetImage(
            imagePath,
          ),
        ),
        Positioned(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    quote,
                    style: const TextStyle(
                      color: Colors.yellow,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.yellow,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: onClick,
                      child: Text(
                        buttonText,
                        style: const TextStyle(color: Colors.black),
                      ))
                ],
              ),
            ))
      ],
    );
  }
}