class WindModel {
  double speed;
  int degrees;

  WindModel({this.speed, this.degrees});

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(speed: json['speed'], degrees: json['deg']);
  }
}
