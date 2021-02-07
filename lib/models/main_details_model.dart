class MainDetailsModel {
  double temperature;
  double feelsLike;

  MainDetailsModel({this.temperature, this.feelsLike});

  factory MainDetailsModel.fromJson(Map<String, dynamic> json) {
    return MainDetailsModel(
      temperature: json['temp'],
      feelsLike: json['feels_like']
    );
  }
}
