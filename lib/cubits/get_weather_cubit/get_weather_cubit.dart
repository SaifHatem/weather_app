import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';

import '../../models/weather_model.dart';
import '../../services/weather_services.dart';

// Step 2 Create Cubit
class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;
// Step 3 Create Function
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedSuccessfullyState(weatherModel!));
    } catch (e) {
      emit(WEatherFailureState(
        e.toString(),
      ));
    }
  }
}
