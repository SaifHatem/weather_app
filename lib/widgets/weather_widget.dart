import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key, required this.wather});
  final WeatherModel wather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          getThemeColor(weatherModel.weatherCondition),
          getThemeColor(weatherModel.weatherCondition)[300]!,
          getThemeColor(weatherModel.weatherCondition)[50]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Updated at : ${weatherModel.date.hour}:${weatherModel.date.minute} '),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network('https:${weatherModel.image}'),
                Text(
                  weatherModel.temp.toString(),
                  style: const TextStyle(fontSize: 24),
                ),
                Column(
                  children: [
                    Text('MaxTemp: ${weatherModel.maxTemp.round()}'),
                    Text('MinTemp: ${weatherModel.minTemp.round()}'),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
