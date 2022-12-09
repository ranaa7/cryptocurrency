import 'package:cryptocurrency/models/home_model.dart';
import 'package:cryptocurrency/network/coin_api.dart';
import 'package:cryptocurrency/network/dio_exceptions.dart';
import 'package:cryptocurrency/screens/detailed_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homeprovider extends ChangeNotifier {
  //di try2t el mvvm
  List<Homemodel> homelist = [];

  Homeprovider() {
    getallcoins();
  }

  getallcoins() async {
    try {
     await CoinApi().getallcoin().then((value) {
        homelist = value;
        print(homelist);
        notifyListeners();

      });

      //orrrr  coinlist= await CoinApi().getallcoin()
    } on DioError catch (e) {
      String error = DioExceptions.fromDioError(e).toString();
      print(error);
      Get.dialog(
          AlertDialog(
            title: Text("error"),
            content: Text(error),
            actions: [
              TextButton(onPressed: ()
              {
                getallcoins();
                Get.back();
                },
                  child: Text("Ok"))
            ],
          )
      );
    }
  }
}
