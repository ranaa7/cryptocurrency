import 'package:cryptocurrency/core/constant.dart';
import 'package:cryptocurrency/models/detailed_model.dart';
import 'package:cryptocurrency/models/home_model.dart';
import 'package:cryptocurrency/models/search_model.dart';
import 'package:dio/dio.dart';

class CoinApi {
  Future<List<Homemodel>> getallcoin() async {
    try {
      final response = await Dio().get(
          baseurl + allcoinendpoint);

      return List<Homemodel>.from(
          response.data.map((x) => Homemodel.fromJson(x)));
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Searchmodel>> getsearchlist(String value) async {
    try {
      final response = await Dio()
          .get(baseurl + allcoinendpoint1 + value);
      return List<Searchmodel>.from(
          response.data["coins"].map((x) => Searchmodel.fromjson(x)));
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Detailedmodel> getdetailed(String id) async {
    try {
      var response =
          await Dio().get(baseurl + allcoinendpoint2 + id);
      return Detailedmodel.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
