import 'package:flutter/material.dart';

import '../shared/menu_drawer.dart';

class ContainerScreen extends StatelessWidget {
  const ContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: const Text('Container Screen'),
      ),
      body: Container(
        margin: const EdgeInsets.all(100),
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
          color: Colors.orange,
          gradient: RadialGradient(
            tileMode: TileMode.mirror,
            radius: 0.25,
            center: Alignment(0, 0.4),
            colors: <Color>[
              Color(0xff1f005c),
              Color(0xff5b0060),
              Color(0xff870160),
              Color(0xffac255e),
              Color(0xffca485c),
              Color(0xffe16b5c),
              Color(0xfff39060),
              Color(0xffffb56b),
            ],
          ),
          // gradient: LinearGradient(
          //   end: Alignment.topCenter,
          //   begin: Alignment.bottomCenter,
          //   colors: <Color>[
          //     Color(0xff1f005c),
          //     Color(0xff5b0060),
          //     Color(0xff870160),
          //     Color(0xffac255e),
          //     Color(0xffca485c),
          //     Color(0xffe16b5c),
          //     Color(0xfff39060),
          //     Color(0xffffb56b),
          //   ],
          // ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
    );
  }
}
