import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(new MyApp());
}

int _weight = 0;
String _text = "Weight";
int _height = 0;
String _bmi = "ENTER";
const double vdk = 411.4;
int _check = 0;
var _clr = <Color>[
  Color.fromRGBO(44, 62, 80, 1),
  Color.fromRGBO(52, 152, 219, 1)
];
//double _fan = 32;
var _font = Color.fromRGBO(173, 239, 209, 1);
String _msg = "Weight and Height";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Calculator",
      home: new Calculator(),
      theme: new ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color.fromRGBO(0, 32, 63, 1),
          accentColor: Colors.red),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Calculator> {
  void px() {
    setState(() {
      if (_text.startsWith("W")) {
        _weight = _weight ~/ 10;
        return;
      } else {
        _height = _height ~/ 10;
        return;
      }
    });
  }

  void press(int num) {
    setState(() {
      if (_text.startsWith("W")) {
        _weight = _weight * 10;
        _weight += num;
        return;
      } else {
        _height = _height * 10;
        _height += num;
      }
    });
  }

  void wt() {
    setState(() {
      _text = "WEIGHT";
    });
  }

  void ht() {
    setState(() {
      _text = "HEIGHT";
    });
  }

  void print() {
    double temp = _weight / (_height * _height);

    if (_check == 0 && _weight != 0) {
      if (temp < 18) {
        _bmi = "Underweight";
        _msg = "🌭🍔EAT MORE🥪🥙";
        _font = Color.fromRGBO(0, 32, 63, 1);
        _clr = [Color.fromRGBO(67, 198, 172, 1), Color.fromRGBO(25, 22, 84, 1)];
      } else if (temp < 25) {
        _bmi = "Perfect";
        _msg = "👍👌🏻Awesome👌🏻👍";
        _font = Color.fromRGBO(173, 239, 209, 1);
        _clr = [
          Color.fromRGBO(0, 90, 167, 1),
          Color.fromRGBO(255, 253, 228, 1)
        ];
      } else if (temp < 30) {
        _bmi = "Overweight";
        _msg = "🏃🏻‍♂️🏃🏻‍♀️DO EXERCISE🏃🏻‍♀️🏃🏻‍♂️";
        _font = Color.fromRGBO(173, 239, 209, 1);
        _clr = [
          Color.fromRGBO(53, 92, 125, 1),
          Color.fromRGBO(108, 91, 123, 1),
          Color.fromRGBO(192, 108, 132, 1)
        ];
      } else {
        _bmi = "Obesity";
        _msg = "🥦Diet🥬+🤸🏻‍♂Gym🤸🏻‍♀💪🏻";
        _font = Color.fromRGBO(0, 32, 63, 1);
        _clr = [Color.fromRGBO(240, 242, 240, 1), Color.fromRGBO(0, 12, 64, 1)];
      }
      //_fan = 40;
      _check = 1;
    } else {
      if (_weight == 0 || _height == 0) {
        _bmi = "Enter";
        _msg = "Weight and Height";
        // _fan = 30;
      } else {
        //_fan = 40;
        _bmi = temp.toStringAsFixed(2);
      }
      _check = 0;
    }
  }

  //@override

  Widget _body() {
    return Center(
        child: Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(children: [
              Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      // 10% of the width, so there are ten blinds.
                      colors: _clr,
                      // red to yellow
                      tileMode: TileMode
                          .repeated, // repeats the gradient over the canvas
                    ),
                    // borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  // margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  padding: const EdgeInsets.only(top: 10.0),
                  height: 100,
                  width: double.maxFinite,
                  // color: Color.fromRGBO(199,211,212,1),
                  child: Center(
                    child: Column(children: [
                      new Text(
                        _bmi,
                        style: new TextStyle(
                          color: _font,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(3.0)),
                      new Text(
                        _msg,
                        style: new TextStyle(
                          color: _font,
                          fontSize: 20.0,
                        ),
                      )
                    ]),
                  )),
            ]),
            Padding(padding: const EdgeInsets.all(12.0)),
            Container(
                padding: const EdgeInsets.all(5.0),
                height: 100,
                width: double.maxFinite,
                child: new TextButton(
                  child: new Text(
                    "WEIGHT = $_weight",
                    style: new TextStyle(
                      color: Color.fromRGBO(0, 32, 63, 1),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(173, 239, 209, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        side: BorderSide(color: Colors.grey),
                      ))),
                  onPressed: wt,
                )),
            Padding(padding: const EdgeInsets.all(12.0)),
            Container(
                padding: const EdgeInsets.all(5.0),
                height: 100,
                width: double.maxFinite,
                child: new TextButton(
                  child: new Text(
                    "HEIGHT = $_height",
                    style: new TextStyle(
                      color: Color.fromRGBO(0, 32, 63, 1),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: ht,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(173, 239, 209, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        side: BorderSide(color: Colors.grey),
                      ))),
                )),
            Padding(padding: const EdgeInsets.all(12.0)),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      color: Color.fromRGBO(0, 32, 63, 1),
                      height: 75.0,
                      width: vdk / 3,
                      child: Container(
                          child: Center(
                        child: new TextButton(
                          child: new Text(
                            "1",
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                            ),
                          ),
                          onPressed: () => press(1),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueAccent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.grey),
                              ))),
                        ),
                      )),
                    ),
                    Container(
                      color: Color.fromRGBO(0, 32, 63, 1),
                      height: 75.0,
                      width: vdk / 3,
                      child: Container(
                          child: Center(
                        child: new TextButton(
                          child: new Text(
                            "2",
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                            ),
                          ),
                          onPressed: () => press(2),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueAccent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.grey),
                              ))),
                        ),
                      )),
                    ),
                    Container(
                      color: Color.fromRGBO(0, 32, 63, 1),
                      height: 75.0,
                      width: vdk / 3,
                      child: Container(
                          child: Center(
                        child: new TextButton(
                          child: new Text(
                            "3",
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                            ),
                          ),
                          onPressed: () => press(3),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueAccent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.grey),
                              ))),
                        ),
                      )),
                    ),
                  ],
                ),
                Padding(padding: const EdgeInsets.all(4.0)),
                Row(
                  children: [
                    Container(
                      color: Color.fromRGBO(0, 32, 63, 1),
                      height: 75.0,
                      width: vdk / 3,
                      child: Container(
                          child: Center(
                        child: new TextButton(
                          child: new Text(
                            "4",
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                            ),
                          ),
                          onPressed: () => press(4),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueAccent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.grey),
                              ))),
                        ),
                      )),
                    ),
                    Container(
                      color: Color.fromRGBO(0, 32, 63, 1),
                      height: 75.0,
                      width: vdk / 3,
                      child: Container(
                          child: Center(
                        child: new TextButton(
                          child: new Text(
                            "5",
                            style: new TextStyle(
                              letterSpacing: 13.0,
                              color: Colors.black,
                              fontSize: 40.0,
                            ),
                          ),
                          onPressed: () => press(5),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueAccent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.grey),
                              ))),
                        ),
                      )),
                    ),
                    Container(
                      color: Color.fromRGBO(0, 32, 63, 1),
                      height: 75.0,
                      width: vdk / 3,
                      child: Container(
                          child: Center(
                        child: new TextButton(
                          child: new Text(
                            "6",
                            style: new TextStyle(
                              letterSpacing: 13.0,
                              color: Colors.black,
                              fontSize: 40.0,
                            ),
                          ),
                          onPressed: () => press(6),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueAccent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.grey),
                              ))),
                        ),
                      )),
                    ),
                  ],
                ),
                Padding(padding: const EdgeInsets.all(4.0)),
                Row(
                  children: [
                    Container(
                      color: Color.fromRGBO(0, 32, 63, 1),
                      height: 75.0,
                      width: vdk / 3,
                      child: Container(
                          child: Center(
                        child: new TextButton(
                          child: new Text(
                            "7",
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                            ),
                          ),
                          onPressed: () => press(7),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueAccent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.grey),
                              ))),
                        ),
                      )),
                    ),
                    Container(
                      color: Color.fromRGBO(0, 32, 63, 1),
                      height: 75.0,
                      width: vdk / 3,
                      child: Container(
                          child: Center(
                        child: new TextButton(
                          child: new Text(
                            "8",
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                            ),
                          ),
                          onPressed: () => press(8),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueAccent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.grey),
                              ))),
                        ),
                      )),
                    ),
                    Container(
                      color: Color.fromRGBO(0, 32, 63, 1),
                      height: 75.0,
                      width: vdk / 3,
                      child: Container(
                          child: Center(
                        child: new TextButton(
                          child: new Text(
                            "9",
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                            ),
                          ),
                          onPressed: () => press(9),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueAccent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.grey),
                              ))),
                        ),
                      )),
                    ),
                  ],
                ),
                Padding(padding: const EdgeInsets.all(4.0)),
                Row(
                  children: [
                    Container(
                      color: Color.fromRGBO(0, 32, 63, 1),
                      height: 75.0,
                      width: vdk / 3,
                      child: Container(
                          child: Center(
                        child: new TextButton(
                          child: new Text(
                            "x",
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                            ),
                          ),
                          onPressed: px,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(173, 239, 209, 1)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                side: BorderSide(color: Colors.grey),
                              ))),
                        ),
                      )),
                    ),
                    Container(
                      color: Color.fromRGBO(0, 32, 63, 1),
                      height: 75.0,
                      width: vdk / 3,
                      child: Container(
                          child: Center(
                        child: new TextButton(
                          child: new Text(
                            "0",
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                            ),
                          ),
                          onPressed: () => press(0),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueAccent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.grey),
                              ))),
                          //color: Colors.amber,
                        ),
                      )),
                    ),
                    Container(
                      color: Color.fromRGBO(0, 32, 63, 1),
                      height: 75.0,
                      width: vdk / 3,
                      child: Container(
                          // child: p,

                          child: Center(
                        child: new TextButton(
                          child: new Text(
                            "=",
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              print();
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(173, 239, 209, 1)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                side: BorderSide(color: Colors.grey),
                              ))),
                        ),
                      )),
                    ),
                  ],
                ),
                Padding(padding: const EdgeInsets.all(7.0)),
              ],
            ),
          ]),
    ));
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(0, 32, 63, 1),
        centerTitle: true,
        title: new Text(
          "BMI CALCULATOR",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: _body(),
    );
  }
}
