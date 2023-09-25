import 'package:flutter/material.dart';

class Cont extends StatelessWidget {
  final Color color;
  final Widget cardChild;

  Cont(Color this.color, Widget this.cardChild);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
