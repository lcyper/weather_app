part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable{
  WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class LoadingWeatherState extends WeatherState {}
class ShowWeatherState extends WeatherState {
  final MetaweatherClass weather;
  ShowWeatherState(MetaweatherClass metaweatherClass):weather=metaweatherClass;

}