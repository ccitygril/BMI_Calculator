import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const InputPage(title: 'Flutter Demo Home Page'),
    );
  }
}

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? gender;
  var age = 20;
  var height = 0;
  var weight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBG,
      appBar: AppBar(
        backgroundColor: kBG,
        title: Text(
          "BMI CALCULATOR",
          style: kBodyTextStyle,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  onTap: () {
                    setState(() {
                      gender = Gender.male;
                    });
                  },
                  color: gender == Gender.male
                      ? kActiveCardColur
                      : kInactiveCardColur,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.mars, size: 100),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "MALE",
                        style: kBodyTextStyle,
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  onTap: () {
                    setState(() {
                      gender = Gender.female;
                    });
                  },
                  color: gender == Gender.female
                      ? kActiveCardColur
                      : kInactiveCardColur,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.venus, size: 100),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "FEMALE",
                        style: kBodyTextStyle,
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: kBodyTextStyle,
                ),
                Text(
                  height.toString(),
                  style: kNumberTextStyle,
                ),
                Slider(
                  activeColor: kBottomCardColur ,
                    value: height.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        height = value.round();
                      });
                    })
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard()),
                Expanded(child: ReusableCard())
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget? child;
  final Function()? onTap;

  const ReusableCard({
    Key? key,
    this.color = kInactiveCardColur,
    this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('color', color));
    properties.add(ColorProperty('color', color));
  }
}
