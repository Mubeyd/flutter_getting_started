import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_started/shared/menu_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final double fontSize = 28;
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  String heightMessage = '';
  String weightMessage = '';
  late List<bool> isSelected;

  @override
  void initState() {
    log('data: 111111111111111111111');
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('data: 111111111111111111111');

    heightMessage =
        'Please insert your height in ' + ((isMetric) ? 'meters' : 'inches');
    weightMessage =
        'Please insert your weight in ' + ((isMetric) ? 'kilos' : 'pounds');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bmi Calculator'),
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const BottomMenu(), // todo: to be implemented later.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ToggleButtons(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Metric',
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Imperial',
                    style: TextStyle(fontSize: fontSize),
                  ),
                )
              ],
              isSelected: isSelected,
              onPressed: toggleMeasure,
            ),
            TextField(
              controller: txtHeight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: heightMessage),
            ),
            TextField(
              controller: txtWeight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: weightMessage),
            ),
            ElevatedButton(
                onPressed: findBmi,
                child: Text(
                  'Calculate Bmi',
                  style: TextStyle(fontSize: fontSize),
                )),
            Text(
              result,
              style: TextStyle(fontSize: fontSize),
            )
          ],
        ),
      ),
    );
  }

  void toggleMeasure(int index) {}

  void findBmi() {}
}

class BottomMenu extends StatelessWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
