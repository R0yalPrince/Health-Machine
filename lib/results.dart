import 'package:bmi_calculator/Cont.dart';
import 'package:bmi_calculator/comstants.dart';
import 'package:bmi_calculator/input.dart';
import 'package:flutter/material.dart';

class results extends StatelessWidget {
  late final String bmiresult;
  late final String bmitext;
  late final String inter;
  results(this.bmiresult, this.bmitext, this.inter);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI REPORT'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 20)),
          Expanded(
              child: Container(child: Text('Your Result', style: labtextst2))),
          Expanded(
            flex: 5,
            child: Cont(
                activecc,
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        bmitext,
                        style: TextStyle(
                            color: Color(0xFF24D876),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        bmiresult,
                        style: TextStyle(
                            fontSize: 100, fontWeight: FontWeight.bold),
                      ),
                      Text(inter, style: labtextst),
                    ])),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InputPage(),
                ),
              );
            },
            child: Container(
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              // padding: EdgeInsets.only(bottom: 20),
              height: 80,
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
