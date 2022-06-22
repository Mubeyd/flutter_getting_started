import 'package:flutter/material.dart';
import 'package:get_started/screens/bmi_screen.dart';
import 'package:get_started/screens/hello_flutter_layout_screen.dart';
import 'package:get_started/screens/intro_screen.dart';
import 'package:get_started/screens/sessions_screen.dart';
import 'package:get_started/screens/weather_screen.dart';

import '../screens/area_calculator.dart';
import '../screens/container_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'BMI Calculator',
      'Weather',
      'Training',
      'Hello Fluter Layout',
      'Container Screen',
      'Area Calculator',
    ];

    List<Widget> menuItems = [];

    menuItems.add(const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text(
          'Globe Fitness',
          style: TextStyle(color: Colors.white, fontSize: 28),
        )));

    for (var element in menuTitles) {
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(
          element,
          style: const TextStyle(fontSize: 18),
        ),
        onTap: () {
          switch (element) {
            case 'Home':
              screen = const IntroScreen();
              break;
            case 'BMI Calculator':
              screen = const BmiScreen();
              break;
            case 'Weather':
              screen = const WeatherScreen();
              break;
            case 'Training':
              screen = const SessionsScreen();
              break;
            case 'Hello Fluter Layout':
              screen = const HelloFlutterLayout();
              break;
            case 'Container Screen':
              screen = const ContainerScreen();
              break;
            case 'Area Calculator':
              screen = const AreaCalculator();
              break;
          }
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
      ));
    }
    return menuItems;
  }
}
