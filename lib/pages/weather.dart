import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/bloc/weather_bloc.dart';

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // WeatherBloc weatherBloc = context.watch<WeatherBloc>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
              BlocBuilder<WeatherBloc, WeatherState>(
                buildWhen: (previous, current) =>
                    previous.runtimeType != current.runtimeType,
                builder: (context, state) {
                  if (state is WeatherInitial) {
                    return Text('Escribe la ciudad');
                  } else if (state is LoadingWeatherState) {
                    return LinearProgressIndicator();
                  } else if (state is ShowWeatherState) {
                    String text = state.weather.title +
                        ' ' +
                        state.weather.consolidatedWeather![0].theTemp
                            .toString() +
                        ' ºC';
                    return Text(text);
                  } else if (state is ErrorWeatherState) {
                    return Text(state.error);
                  } else {
                    return Text('caso no implementado');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
