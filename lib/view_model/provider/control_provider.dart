import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class Controlprovider extends ChangeNotifier{
  FirebaseAuth auth = FirebaseAuth.instance;
  String? uid;
  Controlprovider(){
    control();
  }
   void control(){
    uid=auth.currentUser?.uid??null;
    notifyListeners();
}
}