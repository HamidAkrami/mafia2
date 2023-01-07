import 'dart:convert';

import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/data/models/specofaction_model.dart';

class GameModel {
  int? isMafia, id, voteCount;
  bool? isRemove,
      ability,
      isTargeted,
      isSaved,
      isInquiry,
      isMafiaShot,
      isSniperShot,
      jokerTarget,
      isWolf,
      gun,
      drygun,
      redCarpet,
      greenway,
      silence,
      isImmortal,
      yellowCart;

  String? description, image, role, name;
  GameModel? target, target2;

  List<Specification> specificationColor = [
    Specification("فرش قرمز", grey),
    Specification("مسیر سبز", grey),
    Specification("کارت زرد", grey),
    Specification("سکوت(سایلنس)", grey),
    Specification("تفنگ جنگی", grey),
    Specification("تفنگ مشقی", grey),
  ];
  GameModel({
    this.name,
    this.role,
    this.isWolf,
    this.isMafia,
    this.isRemove,
    this.description,
    this.image,
    this.ability,
    this.isTargeted,
    this.isSaved,
    this.isInquiry,
    this.isMafiaShot,
    this.isSniperShot,
    this.jokerTarget,
    this.isImmortal,
    this.gun,
    this.drygun,
    this.redCarpet,
    this.greenway,
    this.silence,
    this.yellowCart,
    this.id,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
      name: json["name"],
      role: json["role"],
      isWolf: json["isWolf"],
      isMafia: json["isMafia"],
      isRemove: json["isRemove"],
      description: json["description"],
      image: json["image"],
      ability: json["ability"],
      isTargeted: json["isTargeted"],
      gun: json["gun"],
      drygun: json["drygun"],
      redCarpet: json["redCarpet"],
      greenway: json["greenway"],
      silence: json["silence"],
      isImmortal: json["isImmortal"],
      yellowCart: json["yellowCart"]);
  Map<String, dynamic> toJson() => {
        "name": name,
        "role": role,
        "isWolf": isWolf,
        "isMafia": isMafia,
        "isRemove": isRemove,
        "description": description,
        "image": image,
        "ability": ability,
        "isTargeted": isTargeted,
        "gun": gun,
        "drygun": drygun,
        "redCarpet": redCarpet,
        "greenway": greenway,
        "silence": silence,
        "isImmortal": isImmortal,
        "yellowCart": yellowCart,
        "id": id
      };
}
