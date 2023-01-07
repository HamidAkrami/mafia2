import 'dart:convert';

import 'package:get/get.dart';

import 'package:mafia2/app/core/utils/key.dart';
import 'package:mafia2/app/data/models/players_model.dart';
import 'package:mafia2/app/data/service/storage/storage_service.dart';

class MafiaProvider {
  final _storage = Get.find<StorageService>();
  List<PlayersModel> readPlayers() {
    var players = <PlayersModel>[];
    jsonDecode(_storage.read(playerKey).toString())
        .forEach((e) => players.add(PlayersModel.fromJson(e)));
    return players;
  }

  void writePlayers(List<PlayersModel> players) {
    _storage.write(playerKey, jsonEncode(players));
  }

  // List<GameModel> readGamePlayers() {
  //   var players = <GameModel>[];
  //   if (_storage.read(gamePlayerKey) != null) {
  //     jsonDecode(_storage.read(gamePlayerKey).toString())
  //         .forEach((e) => players.add(GameModel.fromJson(e)));
  //   }

  //   return players;
  // }

  // void writeGamePlayers(List<GameModel> players) {
  //   // var s = players.map((e) => e.toJson()).toList();
  //   // print(jsonEncode(s));
  //   _storage.write(gamePlayerKey, jsonEncode(players));
  // }
}
