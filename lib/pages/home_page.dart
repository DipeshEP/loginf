import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final UserCredential userCredential;
  const MyHomePage({Key? key, required this.userCredential}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: Center(child: Text(widget.userCredential.user as String)),
    );
  }
}
