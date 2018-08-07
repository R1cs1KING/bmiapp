import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double _result = 0.0;
  String _value = "";

  void handleCalculate() {
    setState(() {
      _result = calculateBMI(_heightController.text, _weightController.text);

      if (_result < 18.5){
        _value = "Undreweight";
      } else if (_result >= 18.5 && _result < 25.0){
        _value = "Normal weight";
      } else if (_result >= 25.0 && _result < 30.0){
        _value = "Overweight";
      } else {
        _value = "Obese";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),

      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset('images/bmilogo.png',
            height: 133.0,
            width: 200.0,),

            new Container(
              decoration: new BoxDecoration(
                color: Colors.grey,
              ),
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[

                  new TextField(
                    controller: null,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Age',
                        hintText: 'Your age',
                        icon: new Icon(Icons.person_outline)
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),

                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Height in feet',
                        hintText: 'Your height in feet',
                        icon: new Icon(Icons.assessment)
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),

                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Weight in lb',
                        hintText: 'Your weight in lb',
                        icon: new Icon(Icons.line_weight)
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),

                  new MaterialButton(
                      color: Colors.pinkAccent,
                      child: const Text ('Calculate',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: handleCalculate,
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
                ],
              ),
            ),

            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[

                  new Text(
                    //_BMIController.text.isEmpty ? "" :
                    "Your BMI: $_result",
                    style: TextStyle(color: Colors.blue,
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                      ),
                  ),

                  new Text(
                    //_BMIController.text.isEmpty ? "" :
                    "$_value",
                    style: TextStyle(color: Colors.pinkAccent,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateBMI(String height, String weight) {

    if (int.parse(height).toString().isNotEmpty && int.parse(height) > 0 && int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return (int.parse(weight) / (int.parse(height) * int.parse(height))) * 703;
    } else {
      print("Wrong!");
          }
  }
}