
import 'dart:math';

import 'package:cryptocurrency/models/detailed_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../network/coin_api.dart';
import '../../network/dio_exceptions.dart';
import '../../screens/detailed_screen.dart';

class Detailedprovider extends ChangeNotifier {

   Detailedmodel? detail;


  Future getdetailed(String id) async {
    try {
      CoinApi().getdetailed(id).then((value) {
        detail = value;
        notifyListeners();
        Get.to(() => Detailscreen());
      });
    }on DioError catch(e){
      String error = DioExceptions.fromDioError(e).toString();
      print(error);
      Get.dialog(
          AlertDialog(
            title: Text("error"),
            content: Text(error),
            actions: [
              TextButton(onPressed: ()
              {
                getdetailed(id);
                Get.back();
              },
                  child: Text("Ok"))
            ],
          )
      );
    }
  }
}