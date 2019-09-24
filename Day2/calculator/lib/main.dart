import 'package:flutter/material.dart';

main() => runApp(Calculator());

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var output = new TextEditingController();
  String val = "";
  double tempval1, tempval2, result;
  String operat;
  String disp = "";
  buttonPressed(String passed) {
    setState(() {
      if(((passed.codeUnitAt(0) >= "0".codeUnitAt(0) && passed.codeUnitAt(0) <= "9".codeUnitAt(0)) || passed=="00") || passed == "."){
        if(val == ""){
          val = passed;
          disp = "$disp$passed";
        }
        else{
          val = "$val$passed";
          disp = "$disp$passed";
        }
      }
      else if(passed == "+" || passed == "-" || passed == "*" || passed == "/"){
        tempval1 = double.parse(val);
        disp = "$val$passed";
        output.text = disp;
        val = "";
        operat = passed;
      }
      else if(passed=="Clear"){
        output.text = "";
        val= "";
        tempval1 = 0;
        tempval2 = 0;
        operat = "";
        result = 0;
        disp = "";
      }
      else if(passed == "="){
        tempval2 = double.parse(val);
        val = "";
        if(operat == "+"){
          result = tempval1 + tempval2;
        }
        else if(operat == "-")
          result = tempval1 - tempval2;
        else if(operat == "*")
          result = tempval1 * tempval2;
        else if(operat == "/")
          result = tempval1 / tempval2;
        else
          result = double.parse(disp);
      }
      if(passed != "Clear")
        output.text = disp;
      if(passed == "=")
        output.text = result.toString();
    
      
    });
  }

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        
        child: new Text(
          buttonText,
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 15.0,
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }
  @override
  Widget build(BuildContext conext) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
               margin: EdgeInsets.only(top: 150.0),
                child: new TextField(
                  decoration: InputDecoration(
                    hintText: "Input Operand",
                    enabled: false,
                  ),
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                  controller: output,
                ),
              ),
              new Expanded(child: new Divider()),
              new Row(
                children: <Widget>[
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),
                ],
              ),
              new Row(
                children: <Widget>[
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("*"),
                ],
              ),
              new Row(
                children: <Widget>[
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),
                ],
              ),
              new Row(
                children: <Widget>[
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+"),
                ],
              ),
              new Row(
                children: <Widget>[
                  buildButton("Clear"),
                  buildButton("="),
                ],
              ),
            ],
          ),
        ),
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}