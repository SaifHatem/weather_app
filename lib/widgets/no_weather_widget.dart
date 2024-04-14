import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No weather now 😢',
          style: TextStyle(fontSize: 25),
        ),
        Text(
          'Start Search 🔎 ',
          style: TextStyle(fontSize: 25),
        ),
      ],
    ));
  }
}
