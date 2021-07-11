import 'package:dio/dio.dart';
import 'package:weather_app/data/weather_repository.dart';

class Metaweather implements WeatherRepository {
  String urlBase = 'https://www.metaweather.com/api/location/';

  Future<Map> _byLocationId(int id) async {
    Map data = {};
    try {
      Response response = await Dio().get(urlBase + id.toString());
      data = response.data;
      // return data;
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  Future<Map<String, dynamic>> byQuery(String city) async {
    Map data = {};
    try {
      Response response = await Dio()
          .get(urlBase + 'search/', queryParameters: {'query': city});
      if (response.data.length > 0) {
        // data['id'] = response.data[0]['woeid'];
        data = await _byLocationId(response.data[0]['woeid']);
        // data = Map<String, dynamic>.from(data);
        // data = {'id': response.data[0]['woeid']};
        // return data;
      } else {
        data = {'error': 'no se encontro datos'};
        print('no hay datos');
      }
    } catch (e) {
      print(e);
    }
    return Map<String, dynamic>.from(data);
  }
}
