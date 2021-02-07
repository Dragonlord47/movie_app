import 'package:movieApp1/models/main_details_model.dart';
import 'package:movieApp1/models/weather_model.dart';
import 'package:movieApp1/models/wind_model.dart';

class DataModel {
  List<WeatherModel> weather;
  MainDetailsModel main;
  WindModel wind;

  DataModel({this.weather, this.main, this.wind});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    //(json['weather'] as List).map((item) => WeatherModel.fromJson(item)).toList(),
    // List<WeatherModel> list = new List<WeatherModel>();
    // List weatherMaps = json['weather'] as List;
    // for (Map item in weatherMaps) {
    //   list.add(WeatherModel.fromJson(item));
    // }
    return DataModel(
        weather: (json['weather'] as List)
            .map((item) => WeatherModel.fromJson(item))
            .toList(),
        main: MainDetailsModel.fromJson(json['main']),
        wind: WindModel.fromJson(json['wind']));
  }
}
