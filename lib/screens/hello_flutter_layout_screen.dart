import 'package:flutter/material.dart';

import '../shared/menu_drawer.dart';

class HelloFlutterLayout extends StatelessWidget {
  const HelloFlutterLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: const Text('Hello flutter layout'),
      ),
      body: const Center(
        child: Text(
          'Hello flutter layout',
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        child: Icon(Icons.lightbulb_outline),
        onPressed: null,
      ),
      persistentFooterButtons: const <Widget>[
        IconButton(onPressed: null, icon: Icon(Icons.add_comment)),
        IconButton(onPressed: null, icon: Icon(Icons.add_alarm)),
        IconButton(onPressed: null, icon: Icon(Icons.add_location)),
      ],
    );
  }
}
