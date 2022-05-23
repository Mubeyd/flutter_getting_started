import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_started/data/weather.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey =
      dotenv.get('WEATHER_API_KEY', fallback: 'API_URL not found');

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appid': apiKey};
    
    var url = Uri.https(authority, path, parameters);
    http.Response results = await http.get(url);

    Map<String, dynamic> data = json.decode(results.body);

    Weather weather = Weather.fromJson(data);

    return weather;
  }
}
