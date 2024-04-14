import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedSuccessfullyState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedSuccessfullyState(this.weatherModel);
}

class WEatherFailureState extends WeatherState {
  final String errorMessage;

  WEatherFailureState(this.errorMessage);
}
