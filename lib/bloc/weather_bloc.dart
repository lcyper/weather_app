import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/metaweather.dart';
import 'package:weather_app/data/metaweather_class.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial());
  //TODO: recibir por paremetro de donde se traen los datos WeatherRepository

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeather) {
      yield LoadingWeatherState();
      Map<String, dynamic> map = await Metaweather().byQuery(event.city);
      if (map['error'] != null) {
        yield ErrorWeatherState(map['error']);
      } else {

      MetaweatherClass metaweatherClass = MetaweatherClass.fromJson(map);
      yield ShowWeatherState(metaweatherClass);
      print(map);
      // map = await Metaweather().byLocationId(map.id);
      }
    }
  }
}
