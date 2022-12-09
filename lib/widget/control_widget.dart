import 'package:cryptocurrency/screens/home_screen.dart';
import 'package:cryptocurrency/screens/login_screen.dart';
import 'package:cryptocurrency/view_model/provider/control_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ControlView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Controlprovider>(builder: (context,provider,child){
      return provider.uid==null? LoginScreen():Homescreen();

    });
  }
}