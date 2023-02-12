import 'package:dio/dio.dart';
import '../models/covid_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url =
      'https://api.covid19api.com/summary'; 
      //servis bazen çalışmayabiliyor 
      //**** https://mocki.io/v1/2fd05755-f3d9-4cea-9e13-f659088ed613 **** 
      //çalışmazsa hazırladığım bu mock api kullanılabilir aynı responsu kopyaladım

  Future<CovidModel> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url);
      //debugPrint(response.data.toString());
      return CovidModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CovidModel.withError("Data not found / Connection issue");
    }
  }
}
