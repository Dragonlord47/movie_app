import 'package:http/http.dart' as http;
import 'package:movieApp1/models/data_model.dart';
import 'dart:convert';

class RequestOperations {
  String apiUrl = "https://api.openweathermap.org/data/2.5";
  String apiKey = "dcefe328ea955729557c41d6ebe6621a";

  Future<DataModel> getWeather() async {
    String route = apiUrl + '/weather?q=Lagos&appid=$apiKey';

    Map<String, String> headers = {
      'Content-Type': 'Application/json',
      'Accept': 'Application/json'
    };

    http.Response response =
        await http.get(Uri.encodeFull(route), headers: headers);

    int statusCode = response.statusCode;
    if (statusCode == 200) {
      print(response.body);
      var body = json.decode(response.body);

      return DataModel.fromJson(body);
    }

    print(response.body);
    return null;
  }

  Future<List<HourlyModel>> getHourlyData() async {
    String route = apiUrl + '/onecall?lat=6.5244&lon=3.3792&appid=$apiKey';

    Map<String, String> headers = {
      'Content-Type': 'Application/json',
      'Accept': 'Application/json'
    };
    http.Response response =
        await http.get(Uri.encodeFull(route), headers: headers);

    int statusCode = response.statusCode;
    if (statusCode == 200) {
      //print(response.body);
      var body = json.decode(response.body);

      var hourlyMap = body['hourly'] as List;
      print(hourlyMap.toString());
      return  hourlyMap.map((item) => HourlyModel.fromJson(item)).toList();
    }
  }
}
