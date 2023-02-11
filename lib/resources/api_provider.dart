import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/covid_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://mocki.io/v1/2fd05755-f3d9-4cea-9e13-f659088ed613';

  Future<CovidModel> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url);
      return CovidModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CovidModel.withError("Data not found / Connection issue");
    }
  }
}
