import 'package:flutter/cupertino.dart';

class Specification {
  Color? color;
  String? title;
  Specification(this.title, this.color);
  factory Specification.fromJson(Map<String, dynamic> json) => Specification(
        json["color"],
        json["title"],
      );
  Map<String, dynamic> toJson() => {
        "color": color,
        "title": title,
      };
}
