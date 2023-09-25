import 'dart:math';

class calculator {
  final int height;
  final int weight;
  calculator(this.height, this.weight);
  late double _bmi;
  String calculatorbmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getresult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInter() {
    if (_bmi >= 25) {
      return 'It\'s time to focus on your weight.';
    } else if (_bmi > 18.5) {
      return 'You have good Physique.';
    } else {
      return 'You can eat a little bit more.';
    }
  }
}
