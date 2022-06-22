import 'package:flutter/material.dart';

import '../shared/menu_drawer.dart';

class CreateSquaresScreen extends StatelessWidget {
  const CreateSquaresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rows and Columns'),
      ),
      drawer: const MenuDrawer(),
      backgroundColor: Colors.indigo[100],
      body: SizedBox(
        width: sizeX,
        height: sizeY,
        child: Column(
          verticalDirection: VerticalDirection.up,
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: createSquares(5),
        ),
      ),
    );
  }

  List<Widget> createSquares(int numSquares) {
    int i = 0;
    List colors = [
      Colors.amber,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.indigo,
      Colors.lightBlue
    ];
    List<Widget> squares = [];
    while (i < numSquares) {
      Expanded square = Expanded(
          flex: i,
          child: Container(color: colors[i], child: Text(i.toString())));
      i++;
      squares.add(square);
    }
    return squares;
  }
}
