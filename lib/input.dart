import 'package:bmi_calculator/comstants.dart';
import 'package:bmi_calculator/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Cont.dart';
import 'IconContent.dart';
import 'calculator.dart';

enum gender { male, female }

void updatecolor(gender Gender) {
  if (Gender == gender.male) {
    malecard = activecc;
    femalecard = inactivecc;
  } else {
    femalecard = activecc;
    malecard = inactivecc;
  }
}

Color malecard = inactivecc;
Color femalecard = inactivecc;

int height = 180;
int weight = 40;
int age = 18;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updatecolor(gender.male);
                      });
                    },
                    child: Cont(
                      malecard,
                      IconContent(
                        FontAwesomeIcons.mars,
                        "MALE",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updatecolor(gender.female);
                      });
                    },
                    child: Cont(
                      femalecard,
                      IconContent(
                        FontAwesomeIcons.venus,
                        'FEMALE',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Cont(
                activecc,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: labtextst,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: labtextst1),
                        Text(
                          'cm',
                          style: labtextst,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        // activeTrackColor: Colors.white,
                        // overlayColor: Color(0x15EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        activeColor: Color(0xFF8D8E98),
                        inactiveColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        },
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Cont(
                      activecc,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "WEIGHT",
                            style: labtextst,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(weight.toString(), style: labtextst1),
                              Text(
                                'kg',
                                style: labtextst,
                              )
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FloatingActionButton(
                                    heroTag: Text('btn1'),
                                    backgroundColor: Color(0xFF4C4F5E),
                                    child: Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    }),
                                SizedBox(
                                  width: 10,
                                ),
                                FloatingActionButton(
                                    heroTag: Text('btn2'),
                                    backgroundColor: Color(0xFF4C4F5E),
                                    child: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    })
                              ]),
                        ],
                      )),
                ),
                Expanded(
                  child: Cont(
                      activecc,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "AGE",
                            style: labtextst,
                          ),
                          Text(
                            age.toString(),
                            style: labtextst1,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FloatingActionButton(
                                    heroTag: Text('btn3'),
                                    backgroundColor: Color(0xFF4C4F5E),
                                    child: Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    }),
                                SizedBox(
                                  width: 10,
                                ),
                                FloatingActionButton(
                                    heroTag: Text('btn4'),
                                    backgroundColor: Color(0xFF4C4F5E),
                                    child: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    })
                              ]),
                        ],
                      )),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              calculator calc = calculator(height, weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => results(calc.calculatorbmi(),
                          calc.getresult(), calc.getInter())));
            },
            child: Container(
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              // padding: EdgeInsets.only(bottom: 20),
              height: 80,
              child: Center(
                child: Text(
                  'CALCULATE',
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
