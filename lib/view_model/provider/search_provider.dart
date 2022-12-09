import 'package:cryptocurrency/models/search_model.dart';
import 'package:cryptocurrency/network/coin_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Searchprovider extends ChangeNotifier{
  List<Searchmodel> searchlist = [];


  Future getsearchlist(String x)async{
    CoinApi().getsearchlist(x).then((value) {
      searchlist= value;
      print(value);
      notifyListeners();
    });
  }
}