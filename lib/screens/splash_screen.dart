


import 'dart:async';

import 'package:cryptocurrency/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../widget/control_widget.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => ControlView()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(  backgroundColor: Colors.grey,
      body: Center(
        child: Image.asset("assets/cryptocurrency1.jpg"),
      ),  );
  }
}