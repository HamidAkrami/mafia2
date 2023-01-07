// ignore_for_file: list_remove_unrelated_type

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/data/models/game_model.dart';
import 'package:mafia2/app/data/models/players_model.dart';
import 'package:mafia2/app/data/models/lists.dart';
import 'package:mafia2/app/data/models/role_model.dart';
import 'package:mafia2/app/data/service/storage/repository.dart';

class HomeController extends GetxController {
  MafiaRepository? mafiaRepository;
  HomeController({required this.mafiaRepository});
  RxInt roleDistribution = 0.obs;
  RxBool selectedAll = false.obs;
  RxBool isEqualLength = false.obs;
  RxInt selectedPlayers = 0.obs;
  RxInt citizenPickedCounter = 0.obs;
  RxInt simpleCitizen = 1.obs;
  RxInt mafiaPickedCounter = 0.obs;
  RxInt simpleMafia = 1.obs;
  RxInt independentPickedCounter = 0.obs;
  RxInt selectedRoleLength = 0.obs;
  RxString? speaking;
  RxBool showRole = true.obs;
  RxInt aliveCitizenIndex = 0.obs;
  RxInt aliveMafiaIndex = 0.obs;
  RxInt aliveindependentIndex = 0.obs;

  TextEditingController? textEditingController = TextEditingController();
  final playerList = <PlayersModel>[].obs;
  final playerNameList = <String>[].obs;

  final roleList = <RoleModel>[].obs;
  final selectedRoles = <RoleModel>[].obs;
  final firstDivideRolesList = <RoleModel>[].obs;
  final manualDividerList = <GameModel>[].obs;
  final gameList = <GameModel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    ever(playerList, (_) => mafiaRepository!.writePlayers(playerList));
    playerList.assignAll(mafiaRepository!.readPlayers());
  }

  addToRoleList() {
    roleList.clear();
    roleList.addAll(characterList);
  }

  addPlayer() {
    final player =
        PlayersModel(name: textEditingController!.text, isPlay: true);
    if (textEditingController!.text.isEmpty) {
      return;
    } else {
      playerList.add(player);
      textEditingController!.clear();
      update();
    }
  }

  removePlayer(PlayersModel player) {
    playerList.remove(player);
    update();
  }

  changePlayerValue(PlayersModel player) {
    player.isPlay = !player.isPlay!;

    update();
    playerList.refresh();
  }

  removePlayerList() {
    playerList.clear();
    playerNameList.clear();

    update();
  }

  getSelectedPlayers() {
    List rdyPlayers = [];
    rdyPlayers.addAll(playerList.where((p0) => p0.isPlay!));
    selectedPlayers.value = rdyPlayers.length;
  }

  addtoPlayerNameList() {
    playerNameList.clear();
    for (var i = 0; i < playerList.length; i++) {
      if (playerList[i].isPlay!) {
        playerNameList.add(playerList[i].name!);
      }
    }
    shuffleLists(playerNameList);
  }

  selectAllPlayer() {
    selectedAll.value = !selectedAll.value;
    for (var i = 0; i < playerList.length; i++) {
      playerList[i].isPlay = selectedAll.value;
    }

    update();
  }

  reorderPlayerList(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    GameModel player = gameList.removeAt(oldIndex);
    gameList.insert(newIndex, player);
    update();
  }

  changeStatus(GameModel player) {
    player.yellowCart = !player.yellowCart!;
    update();
  }

  changePickValue(RoleModel role) {
    role.isPicked = !role.isPicked!;

    if (role.isPicked!) {
      selectedRoles.add(role);

      if (role.id == 1) {
        simpleCitizen.value =
            selectedRoles.where((p0) => p0.id == 1).toList().length;
      } else if (role.id == 16) {
        simpleMafia.value =
            selectedRoles.where((p0) => p0.id == 16).toList().length;
      }
    } else {
      if (role.id == 1) {
        selectedRoles.removeWhere((element) => element.id == 1);
      } else if (role.id == 16) {
        selectedRoles.removeWhere((element) => element.id == 16);
      } else {
        selectedRoles.remove(role);
      }
    }
    int computing(int side) {
      return selectedRoles
          .where((element) => element.isMafia == side && element.isPicked!)
          .toList()
          .length;
    }

    citizenPickedCounter.value = computing(0);
    mafiaPickedCounter.value = computing(1);
    independentPickedCounter.value = computing(2);
    selectedRoleLength.value = selectedRoles.length;

    equalCheck();
    update();
  }

  changeRemoveValue(GameModel player) {
    player.isRemove = !player.isRemove!;
    computingSideNum();
    update();
  }

  computingSideNum() {
    int computing(int side) {
      return gameList
          .where((element) => element.isMafia == side)
          .toList()
          .length;
    }

    citizenPickedCounter.value = computing(0);
    mafiaPickedCounter.value = computing(1);
    independentPickedCounter.value = computing(2);
    int alivePlayerComputing(int side) {
      return gameList
          .where((p0) => p0.isMafia == side && !p0.isRemove!)
          .toList()
          .length;
    }

    aliveCitizenIndex.value = alivePlayerComputing(0);
    aliveMafiaIndex.value = alivePlayerComputing(1);
    aliveindependentIndex.value = alivePlayerComputing(2);
  }

  increaseSimple(RoleModel role) {
    selectedRoles.add(role);

    if (role.id == 1) {
      simpleCitizen.value++;
      citizenPickedCounter.value = selectedRoles
          .where(
            (p0) => p0.isMafia == 0 && p0.isPicked!,
          )
          .toList()
          .length;
    } else if (role.id == 16) {
      simpleMafia.value++;
      mafiaPickedCounter.value = selectedRoles
          .where(
            (p0) => p0.isMafia == 1 && p0.isPicked!,
          )
          .toList()
          .length;
    }
    selectedRoleLength.value = selectedRoles.length;

    equalCheck();
    update();
  }

  equalCheck() {
    if (selectedRoleLength.value == playerNameList.length) {
      isEqualLength.value = true;
    } else {
      isEqualLength.value = false;
    }
  }

  shuffleLists(List list) {
    list.shuffle();
    update();
  }

  addToGameList(String name) {
    final random = Random();
    var player =
        firstDivideRolesList[random.nextInt(firstDivideRolesList.length)];
    final gamePlayer = GameModel(
        name: name,
        role: player.role,
        ability: player.ability,
        description: player.description,
        id: player.id,
        image: player.image,
        isMafia: player.isMafia,
        isRemove: false,
        drygun: false,
        greenway: false,
        gun: false,
        isWolf: false,
        redCarpet: false,
        silence: false,
        yellowCart: false,
        isImmortal: false,
        isInquiry: false,
        isMafiaShot: false,
        isSniperShot: false,
        isSaved: false,
        jokerTarget: false,
        isTargeted: false);
    gameList.add(gamePlayer);

    playerNameList.remove(name);
    firstDivideRolesList.remove(player);

    update();
  }

  manualDivider(String name, RoleModel element) {
    final gamePlayer = GameModel(
        name: name,
        role: element.role,
        ability: element.ability,
        description: element.description,
        id: element.id,
        image: element.image,
        isMafia: element.isMafia,
        isRemove: false,
        drygun: false,
        greenway: false,
        gun: false,
        isWolf: false,
        redCarpet: false,
        silence: false,
        yellowCart: false,
        isImmortal: false,
        isInquiry: false,
        isMafiaShot: false,
        isSniperShot: false,
        isSaved: false,
        jokerTarget: false,
        isTargeted: false);
    manualDividerList.add(gamePlayer);
    playerNameList.remove(name);
    firstDivideRolesList.remove(element);

    update();
  }

  manualAddToGameList(GameModel element) {
    gameList.add(element);
    manualDividerList.remove(element);

    update();
  }

  refreshDivider() {
    addtoPlayerNameList();
    firstDivideRolesList.clear();
    firstDivideRolesList.addAll(selectedRoles);
    firstDivideRolesList.shuffle();
    manualDividerList.clear();
    gameList.clear();
  }

  // startSpeack() {
  //   String name = gameList
  // }
  changeShowRoleValue() {
    showRole.value = !showRole.value;
    update();
  }
}
