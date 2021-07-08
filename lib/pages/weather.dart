import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/bloc/weather_bloc.dart';

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherBloc weatherBloc = context.watch<WeatherBloc>();
    return Scaffold(
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              autofocus: true,
              onSubmitted: (value) {
                context.read<WeatherBloc>().add(GetWeather(value));
              },
            ),
            Text('Clima'),
          ],
        ),
      ),
    );
  }
}
