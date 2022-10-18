import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'container_box.dart';
import 'data_container.dart';

const activeColor = Color(0xFF0073dd);
const inactiveColor = Color(0xFF212121);

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color maleBoxColor = activeColor;
  Color famaleBoxColor = inactiveColor;
  int height = 180;
  int weight = 68;
  int age = 25;
  String result = "";
  String resultDetail = "RESULT HERE";
  double bmi = 0;

  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleBoxColor == inactiveColor) {
        maleBoxColor = activeColor;
        famaleBoxColor = inactiveColor;
      } else {
        maleBoxColor = inactiveColor;
        famaleBoxColor = activeColor;
      }
    } else {
      if (famaleBoxColor == inactiveColor) {
        famaleBoxColor = activeColor;
        maleBoxColor = inactiveColor;
      } else {
        famaleBoxColor = inactiveColor;
        maleBoxColor = activeColor;
      }
    }
  }

  String calculateBMI(int weight, int height) {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getInterpretation(double bmi) {
    if (bmi >= 25) {
      return "Cизде кадимки дене салмагы жогору. көбүрөөк көнүгүү жасоого аракет кылуу";
    } else if (bmi > 18.5) {
      return "Cизде кадимки дене салмагы бар. Жакшы жумуш!";
    } else {
      return "Cиз нормалдуу дене салмагы төмөн бир чоң көбүрөөк жесе болот";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
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
                      updateBoxColor(1);
                    });
                  },
                  child: ContainerBox(
                    boxColor: maleBoxColor,
                    childWidget: DataContainer(
                      icon: FontAwesomeIcons.mars,
                      title: "MALE",
                    ),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateBoxColor(2);
                    });
                  },
                  child: ContainerBox(
                    boxColor: famaleBoxColor,
                    childWidget: DataContainer(
                      icon: FontAwesomeIcons.venus,
                      title: "FAMELE",
                    ),
                  ),
                ))
              ],
            ),
          ),
          Expanded(
            child: ContainerBox(
              boxColor: inactiveColor,
              childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "HEIGHT",
                      style: textStyle1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toInt().toString(),
                          style: textStyle2,
                        ),
                        const Text(
                          "cm",
                          style: textStyle1,
                        )
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 0,
                      max: 220,
                      activeColor: activeColor,
                      inactiveColor: inactiveColor,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    )
                  ]),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ContainerBox(
                    boxColor: inactiveColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "WEIGHT",
                          style: textStyle1,
                        ),
                        Text(
                          weight.toString(),
                          style: textStyle2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              backgroundColor: activeColor,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: const Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              backgroundColor: activeColor,
                              onPressed: () {
                                setState(() {
                                  if (weight > 0) {
                                    weight--;
                                  }
                                });
                              },
                              child: const Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerBox(
                    boxColor: inactiveColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "AGE",
                          style: textStyle1,
                        ),
                        Text(
                          age.toString(),
                          style: textStyle2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              backgroundColor: activeColor,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: const Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              backgroundColor: activeColor,
                              onPressed: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                              },
                              child: const Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  result = calculateBMI(weight, height);
                  resultDetail = getInterpretation(bmi);

                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: inactiveColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Container(
                            color: inactiveColor,
                            height: 200.0,
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  "Жыйынтык!",
                                  style: textStyle1,
                                ),
                                Text(
                                  result.toString(),
                                  style: textStyle2,
                                ),
                                Text(
                                  resultDetail,
                                  style: textStyle1,
                                )
                              ],
                            ),
                          ),
                        );
                      });
                });
              },
              child: Container(
                child: Center(
                  child: Text(
                    "CALCULATE",
                    style: textStyle3,
                  ),
                ),
                width: double.infinity,
                height: 80.0,
                color: activeColor,
                margin: EdgeInsets.only(top: 10.0),
              ))
        ],
      ),
    );
  }
}
