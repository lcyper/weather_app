part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable{
  WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class LoadingWeather extends WeatherState {}
class ShowWeather extends WeatherState {}