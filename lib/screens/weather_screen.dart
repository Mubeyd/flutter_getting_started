import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({ Key? key }) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  final String apiKey = dotenv.get('WEATHER_API_KEY', fallback: 'API_URL not found');
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}