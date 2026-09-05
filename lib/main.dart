import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // razorpay
  Razorpay razorpay = Razorpay();

  @override
  Widget build(BuildContext context) {

    // from razorpay copy paste
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: OutlinedButton(onPressed: (){
          var options = {
            'key': 'rzp_test_GcZZFDPPOjHtC4',
            'amount': 1000,
            'name': 'Acme Corp.',
            'description': 'Fine T-Shirt',
            'prefill': {
              'contact': '8888888888',
              'email': 'test@razorpay.com'
            }
          };
          // eske vjh se payment hoga
          razorpay.open(options);
        }, child: Text('Pay 10rs'))
      ),
    );
  }

// razorpay package se copy paste kiye h es function ko jo ki handle krega payment succes hua ya fail

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    Fluttertoast.showToast(msg: 'Payment success');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    Fluttertoast.showToast(msg: 'Payment failed');

  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    try{
      razorpay.clear();
    } catch (e) {
      print(e);
    }
  }
}
