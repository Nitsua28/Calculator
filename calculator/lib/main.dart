import 'package:flutter/material.dart';
import 'button.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Calculator")),
        ),
        body: Calculator());
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var _input = '';
  var _answer = '0';

  void equalPressed() {
    Parser par = Parser();
    Expression exp = par.parse(_input);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    _answer = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Container(width: 500, height: 100, 
        decoration: BoxDecoration(
          border: Border.all( width: 1, color: Colors.blue)
      ),
       child: Center(
        child: Text(
          _input,
          style: TextStyle(fontSize: 50))
        )),
      Container(width: 500, height: 100, 
        decoration: BoxDecoration(
          border: Border.all( width: 1, color: Colors.blue)
      ),
       child: Center(
        child: Text(
          _answer,
          style: TextStyle(fontSize: 50))
        )),
      Container(
        width: 500,
        height: 700,
        child: GridView.count(
          primary: false,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 4,
          children: <Widget>[
            Container(
              color: Colors.orange[800],
              child: MyButton(
                buttonText: "C",
                buttontapped: () {
                  setState(() {
                    _input = '';
                    _answer = '0';
                  });
                },
              ),
            ),
            Container(
              color: Colors.orange[800],
              child: MyButton(
                buttonText: "+/-",
                buttontapped: () {},
              ),
            ),
            Container(
              color: Colors.orange[800],
              child: MyButton(
                buttonText: "%",
                buttontapped: () {
                  setState(() {
                    _input += '%';
                  });
                },
              ),
            ),
            Container(
              color: Colors.orange[800],
              child: MyButton(
                buttonText: "DEL",
                buttontapped: () {
                  setState(() {
                    _input = _input.substring(0, _input.length - 1);
                  });
                },
              ),
            ),
            Container(
              color: Colors.teal[100],
              child: MyButton(
                buttonText: "7",
                buttontapped: () {
                  setState(() {
                    _input += '7';
                  });
                },
              ),
            ),
            Container(
              color: Colors.teal[100],
              child: MyButton(
                buttonText: "8",
                buttontapped: () {
                  setState(() {
                    _input += '8';
                  });
                },
              ),
            ),
            Container(
              color: Colors.teal[100],
              child: MyButton(
                buttonText: "9",
                buttontapped: () {
                  setState(() {
                    _input += '9';
                  });
                },
              ),
            ),
            Container(
              color: Colors.orange[800],
              child: MyButton(
                buttonText: "/",
                buttontapped: () {
                  setState(() {
                    _input += '/';
                  });
                },
              ),
            ),
            Container(
              color: Colors.teal[100],
              child: MyButton(
                buttonText: "4",
                buttontapped: () {
                  setState(() {
                    _input += '4';
                  });
                },
              ),
            ),
            Container(
              color: Colors.teal[100],
              child: MyButton(
                buttonText: "5",
                buttontapped: () {
                  setState(() {
                    _input += '5';
                  });
                },
              ),
            ),
            Container(
              color: Colors.teal[100],
              child: MyButton(
                buttonText: "6",
                buttontapped: () {
                  setState(() {
                    _input += '6';
                  });
                },
              ),
            ),
            Container(
              color: Colors.orange[800],
              child: MyButton(
                buttonText: "X",
                buttontapped: () {
                  setState(() {
                    _input += '*';
                  });
                },
              ),
            ),
            Container(
              color: Colors.teal[100],
              child: MyButton(
                buttonText: "1",
                buttontapped: () {
                  setState(() {
                    _input += '1';
                  });
                },
              ),
            ),
            Container(
              color: Colors.teal[100],
              child: MyButton(
                buttonText: "2",
                buttontapped: () {
                  setState(() {
                    _input += '2';
                  });
                },
              ),
            ),
            Container(
              color: Colors.teal[100],
              child: MyButton(
                buttonText: "3",
                buttontapped: () {
                  setState(() {
                    _input += '3';
                  });
                },
              ),
            ),
            Container(
              color: Colors.orange[800],
              child: MyButton(
                buttonText: "+",
                buttontapped: () {
                  setState(() {
                    _input += '+';
                  });
                },
              ),
            ),
            Container(
                color: Colors.teal[100],
                child: MyButton(
                  buttonText: "0",
                  buttontapped: () {
                    setState(() {
                      _input += '0';
                    });
                  },
                )),
            Container(
              color: Colors.teal[100],
              child: MyButton(
                buttonText: ".",
                buttontapped: () {
                  setState(() {
                    _input += '.';
                  });
                },
              ),
            ),
            Container(
              color: Colors.orange[800],
              child: MyButton(
                buttonText: "=",
                buttontapped: () {
                  setState(() {
                    equalPressed();
                  });
                },
              ),
            ),
            Container(
              color: Colors.orange[800],
              child: MyButton(
                buttonText: "-",
                buttontapped: () {
                  setState(() {
                    _input += '-';
                  });
                },
              ),
            ),
          ],
        ),
      )
    ]));
  }
}
