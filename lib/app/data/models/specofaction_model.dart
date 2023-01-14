import 'package:flutter/cupertino.dart';

class Specification {
  Color? color;
  String? title;
  bool? isActive;
  Specification({this.title, this.color, this.isActive});
  factory Specification.fromJson(Map<String, dynamic> json) => Specification(
      color: json["color"], title: json["title"], isActive: json["isActive"]);
  Map<String, dynamic> toJson() =>
      {"color": color, "title": title, "isActive": isActive};
}
