import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

main() => runApp(Currency());

class Currency extends StatefulWidget {
  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  var textController = new TextEditingController();
  var outputcontroller = new TextEditingController();
  buttonPressed(String btntext) {
    if (textController.text == "") {
      print("text empty");
    }

    setState(() {
      double num = double.parse(textController.text);
      //textController.text = "";
      if (btntext == "USD") {
        outputcontroller.text = (num * 0.014).toString();
      } else if (btntext == "EUR") {
        outputcontroller.text = (num * 0.012).toString();
      } else if (btntext == "GBP") {
        outputcontroller.text = (num * 0.011).toString();
      } else if (btntext == "AUS") {
        outputcontroller.text = (num * 0.2).toString();
      } else if (btntext == "CANADA") {
        outputcontroller.text = (num * 0.019).toString();
      } else if (btntext == "YEN") {
        outputcontroller.text = (num * 1.54).toString();
      } else if (btntext == "DINAR") {
        outputcontroller.text = (num * 0.011).toString();
      } else if (btntext == "323") {
        outputcontroller.text = (num * 0.011).toString();
      } else if (btntext == "fgse") {
        outputcontroller.text = (num * 0.011).toString();
      }
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
        onPressed: () =>
            buttonPressed(buttonText), //=> buttonPressed(buttonText) ,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final curr = "INR";
    final finalcurr = "    Final Amount:";
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Currency Converter",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Currency Converter"),
            backgroundColor: Colors.blueAccent,
          ),
          body: Container(
            //margin: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "    From:",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.red[300],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: curr,
                    prefixIcon: const Icon(Icons.money_off),
                  ),
                  controller: textController,
                ),
                new Expanded(
                    child: new Divider(
                  //color: Colors.teal,
                  height: 5.0,
                )),
                new Row(children: <Widget>[
                  buildButton("USD"),
                  buildButton("INR"),
                  buildButton("EUR"),
                ]),
                new Row(children: <Widget>[
                  buildButton("JPY"),
                  buildButton("GBP"),
                  buildButton("CHF"),
                ]),
                new Row(children: <Widget>[
                  buildButton("JPY"),
                  buildButton("GBP"),
                  buildButton("CHF"),
                ]),
                new Expanded(child: new Divider()),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      finalcurr,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.red[300],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 80.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: finalcurr,
                      prefixIcon: const Icon(Icons.money_off),
                      enabled: false,
                    ),
                    controller: outputcontroller,
                  ),
                ),
              ],
            ),
          ),
          resizeToAvoidBottomPadding: false,
        ),
        );
  }
}
