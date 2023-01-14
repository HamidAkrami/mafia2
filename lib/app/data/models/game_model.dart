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
      isImmortal;

  String? description, image, role, name;
  GameModel? target, target2;

  List? specification;
  GameModel(
      {this.name,
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
      this.id,
      this.specification,
      this.voteCount});

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
      isImmortal: json["isImmortal"],
      id: json["id"],
      specification: json["specification"]);
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
        "isImmortal": isImmortal,
        "id": id,
        "specification": specification
      };
}
