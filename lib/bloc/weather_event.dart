part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable{
  final String city;

  const WeatherEvent(this.city);

  @override
  List<Object> get props => [];
}

class GetWeather extends WeatherEvent {
  const GetWeather(String city) : super(city);
}
