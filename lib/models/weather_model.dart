class WeatherModel {
  int id;
  String main;
  String description;
  String icon;

  WeatherModel({this.id, this.main, this.description, this.icon});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}
