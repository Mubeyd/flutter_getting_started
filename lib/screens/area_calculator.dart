// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get_started/shared/menu_drawer.dart';

class AreaCalculator extends StatefulWidget {
  const AreaCalculator({Key? key}) : super(key: key);
  @override
  _AreaCalculatorState createState() => _AreaCalculatorState();
}

class _AreaCalculatorState extends State<AreaCalculator> {
  List<String> shapes = ['Rectangle', 'Triangle'];
  String currentShape = '';
  String result = '0';
  double width = 0;
  double height = 0;

  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    result = '0';
    currentShape = 'Rectangle';
    widthController.addListener(updateWidth);
    heightController.addListener(updateHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area Calculator'),
      ),
      drawer: const MenuDrawer(),
      body: Container(
          margin: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: <Widget>[
              //dropdown
              DropdownButton<String>(
                  value: currentShape,
                  items: shapes.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 24.0),
                      ),
                    );
                  }).toList(),
                  onChanged: (shape) {
                    setState(() {
                      currentShape = shape ?? 'Rectangle';
                    });
                  }),
              // Shape
              ShapeContainer(currentShape),
              //width
              AreaTextField(widthController, 'Width'),
              //height
              AreaTextField(heightController, 'Height'),
              Container(
                margin: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  child: const Text(
                    'Calculate Area',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  onPressed: calculateArea,
                ),
              ),
              Text(
                result,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.green[700],
                ),
              ),
            ],
          )),
    );
  }

  void calculateArea() {
    double area;

    if (currentShape == 'Rectangle') {
      area = width * height;
    } else if (currentShape == 'Triangle') {
      area = width * height / 2;
    } else {
      area = 0;
    }
    setState(() {
      result = 'The area is ' + area.toString();
    });
  }

  void updateWidth() {
    setState(() {
      if (widthController.text != '') {
        width = double.parse(widthController.text);
      } else {
        width = 0;
      }
    });
  }

  void updateHeight() {
    setState(() {
      if (heightController.text != '') {
        height = double.parse(heightController.text);
      } else {
        height = 0;
      }
    });
  }
}

class AreaTextField extends StatelessWidget {
  const AreaTextField(this.controller, this.hint);

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15.0),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: TextStyle(
              color: Colors.green[700],
              fontWeight: FontWeight.w300,
              fontSize: 24.0),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.border_all),
            filled: true,
            fillColor: Colors.grey[300],
            hintText: hint,
          ),
        ));
  }
}

class ShapeContainer extends StatelessWidget {
  final String shape;

  const ShapeContainer(this.shape);

  @override
  Widget build(BuildContext context) {
    if (shape == 'Triangle') {
      return CustomPaint(
        size: const Size(100, 100),
        painter: TrianglePainter(),
      );
    } else {
      return CustomPaint(
        size: const Size(100, 100),
        painter: RectanglePainter(),
      );
    }
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.orange;

    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.deepPurple;

    Rect rect =
        Rect.fromLTRB(0, size.height / 4, size.width, size.height / 4 * 3);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
