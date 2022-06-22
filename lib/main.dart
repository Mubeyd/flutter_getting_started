import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_started/screens/bmi_screen.dart';
import 'package:get_started/screens/intro_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env.development');
  runApp(const GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme:
              const ColorScheme.light(primary: Color(0xff00796B)).copyWith(
            secondary: const Color(0xff7C4DFF),
          ),
          textTheme: const TextTheme(bodyText2: TextStyle(fontSize: 24, fontStyle: FontStyle.italic))
        ),
      routes: {
        '/': ((context) => const IntroScreen()),
        '/bmi': ((context) => const BmiScreen())
      },
      initialRoute: '/',
    );
  }
}
