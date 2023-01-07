class PlayersModel {
  String? name;
  bool? isPlay;

  PlayersModel({this.name, this.isPlay});

  PlayersModel copyWith({String? name, bool? isplay}) => PlayersModel(
        name: name ?? this.name,
        isPlay: isPlay ?? this.isPlay,
      );

  factory PlayersModel.fromJson(Map<String, dynamic> json) =>
      PlayersModel(name: json["name"], isPlay: json["isPlay"]);
  Map<String, dynamic> toJson() => {"name": name!, "isPlay": isPlay!};
}
