import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:toast/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';

main() => runApp(Payment());

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  Razorpay _razorpay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Done!");

    try {
      Fluttertoast.showToast(msg: "Success" + response.paymentId);
    } catch (e) {
      print(e);
    }
    //print(response.paymentId.toString());
    //Fluttertoast.
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment failed");
    Fluttertoast.showToast(
      msg: "Failed" + response.message + response.code.toString()
    );
    // Toast.show(
    //   "Error" + response.code.toString() + " " + response.message,
    // );
  }

  void _handleExternalWallet(response) {
    print("External Wallet");
    Fluttertoast.showToast(
      msg: "Wallet" + response.walletName
    );
    //print(response.walletName);
  }

  checkout() async {
    var options = {
      'key': 'rzp_test_MD9vZgygdTCH4e',
      'amount': 120 * 100,
      'name': 'Courses',
      'description': 'Flutter',
      'prefill': {
        'contact': '9413460572',
        'email': 'test@razorpay.com',
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 400,
                child: Image(
                  image: NetworkImage(
                      "https://i.pinimg.com/originals/43/ce/d9/43ced96935d584397c207afdbb074659.jpg"),
                ),
              ),
              // RaisedButton(
              //   child: Text(
              //     "Pay",
              //   ),
              //   onPressed: (){
              //     _razorpay.open(options);
              //   },
              // ),
              CupertinoButton(
                child: Text(
                  "Pay!",
                ),
                onPressed: () {
                  checkout();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
