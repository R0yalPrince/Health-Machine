import 'package:flutter/material.dart';
import 'package:bmi_calculator/input.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(primary: Color(0xFF111428), secondary: Colors.purple),
        scaffoldBackgroundColor: Color(0xFF111428),
      ),
      home: InputPage(),
    );
  }
}
