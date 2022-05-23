import 'package:flutter/material.dart';
import 'package:get_started/data/http_helper.dart';
import 'package:get_started/data/weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather results = Weather('', '', 0, 0, 0, 0);
  final TextEditingController txtPlace = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: TextField(
                controller: txtPlace,
                decoration: InputDecoration(
                    hintText: 'Enter a city',
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.search), onPressed: getData)),
              ),
            ),
            weatherRow('Place', results.name),
            weatherRow('Description', results.description),
            weatherRow('Temperature', results.temperature.toStringAsFixed(2)),
            weatherRow('Perceived', results.perceived.toStringAsFixed(2)),
            weatherRow('Pressure', results.pressure.toString()),
            weatherRow('Humidity', results.humidity.toString()),
          ],
        ),
      ),
    );
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();

    results = await helper.getWeather(txtPlace.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
              child: Text(
            label,
            style: TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
          )),
          Expanded(
              child: Text(
            value,
            style:
                TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
          )),
        ],
      ),
    );

    return row;
  }
}
