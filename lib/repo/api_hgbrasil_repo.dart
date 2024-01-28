import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/clima.dart';


var request ='https://api.hgbrasil.com/weather?key=SUA-CHAVE&city_name=';

class ClimaRepository {
  Future<Clima> getClima(String nameCity) async {

    http.Response response = await http.get( Uri.parse("$request$nameCity"));
    Map<String, dynamic> dates = json.decode(response.body);
    Clima c = Clima.fromJson(dates);
    return c;
  }
}