// ignore_for_file: list_remove_unrelated_type

import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/data/models/game_model.dart';
import 'package:mafia2/app/data/models/players_model.dart';
import 'package:mafia2/app/data/models/lists.dart';
import 'package:mafia2/app/data/models/role_model.dart';
import 'package:mafia2/app/data/service/storage/repository.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../core/value/sound_constants.dart';
import '../../data/models/specofaction_model.dart';

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
  RxInt gameTime = 0.obs;
  RxInt timerDuration = 30.obs;
  RxInt setTimerDuration = 30.obs;
  RxBool timerIsRunning = false.obs;

  TextEditingController? textEditingController = TextEditingController();
  final playerList = <PlayersModel>[].obs;
  final playerNameList = <String>[].obs;
  final finalNameList = <String>[].obs;
  final roleList = <RoleModel>[].obs;
  final selectedRoles = <RoleModel>[].obs;
  final firstDivideRolesList = <RoleModel>[].obs;
  final manualDividerList = <GameModel>[].obs;
  var gameList = <GameModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    ever(playerList, (_) => mafiaRepository!.writePlayers(playerList));
    playerList.assignAll(mafiaRepository!.readPlayers());

    // loadGame();
  }

  // saveGame() {
  //   ever(gameList, (_) => mafiaRepository!.writeGame(gameList));
  //   print("saved");
  // }

  loadGame() {
    gameList.assignAll(mafiaRepository!.readGame());
  }

  playAudio(String sound) {
    AudioPlayer audioPlayer = AudioPlayer();

    audioPlayer.play(AssetSource(sound));
  }

  playMusic(String sound) {}

  addToRoleList() {
    roleList.clear();
    for (var element in characterList) {
      element.isPicked = false;
    }
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
    getSelectedPlayers();
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
    getSelectedPlayers();
    update();
  }

  int getSelectedPlayers() {
    return selectedPlayers.value =
        playerList.where((p0) => p0.isPlay!).toList().length;
  }

  addtoPlayerNameList() {
    playerNameList.clear();

    for (var element in playerList) {
      if (element.isPlay!) {
        playerNameList.add(element.name!);
      }
    }
  }

  addtoFinalNameList() {
    finalNameList.clear();
    finalNameList.addAll(playerNameList);
  }

  selectAllPlayer() {
    selectedAll.value = !selectedAll.value;

    for (var element in playerList) {
      element.isPlay = selectedAll.value;
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
    gameList.refresh();
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
        isWolf: false,
        isImmortal: player.id == 2 ? true : false,
        isInquiry: false,
        isMafiaShot: false,
        isSniperShot: false,
        isSaved: false,
        jokerTarget: false,
        isTargeted: false,
        voteCount: 0,
        specification: [
          {
            "title": "sts0".tr,
            "color": red.withOpacity(0.3),
            "isActive": false
          },
          {
            "title": "sts1".tr,
            "color": greenDark.withOpacity(0.3),
            "isActive": false
          },
          {
            "title": "sts2".tr,
            "color": yellow.withOpacity(0.3),
            "isActive": false
          },
          {
            "title": "sts3".tr,
            "color": white.withOpacity(0.3),
            "isActive": false
          },
          {
            "title": "sts4".tr,
            "color": red.withOpacity(0.3),
            "isActive": false
          },
          {"title": "sts5".tr, "color": red.withOpacity(0.3), "isActive": false}
          // Specification(title: "sts0".tr, color: red, isActive: false),
          // Specification(title: "sts1".tr, color: greenDark, isActive: false),
          // Specification(title: "sts2".tr, color: yellow, isActive: false),
          // Specification(title: "sts3".tr, color: white, isActive: false),
          // Specification(title: "sts4".tr, color: red, isActive: false),
          // Specification(title: "sts5".tr, color: red, isActive: false),
        ]);
    gameList.add(gamePlayer);

    finalNameList.remove(name);
    firstDivideRolesList.remove(player);
    print(gameList.length);
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
        isWolf: false,
        isImmortal: element.id == 2 ? true : false,
        isInquiry: false,
        isMafiaShot: false,
        isSniperShot: false,
        isSaved: false,
        jokerTarget: false,
        isTargeted: false,
        voteCount: 0,
        specification: [
          {
            "title": "sts0".tr,
            "color": red.withOpacity(0.3),
            "isActive": false
          },
          {
            "title": "sts1".tr,
            "color": greenDark.withOpacity(0.3),
            "isActive": false
          },
          {
            "title": "sts2".tr,
            "color": yellow.withOpacity(0.3),
            "isActive": false
          },
          {
            "title": "sts3".tr,
            "color": white.withOpacity(0.3),
            "isActive": false
          },
          {
            "title": "sts4".tr,
            "color": red.withOpacity(0.3),
            "isActive": false
          },
          {"title": "sts5".tr, "color": red.withOpacity(0.3), "isActive": false}
          // Specification(title: "sts0".tr, color: red, isActive: false),
          // Specification(title: "sts1".tr, color: greenDark, isActive: false),
          // Specification(title: "sts2".tr, color: yellow, isActive: false),
          // Specification(title: "sts3".tr, color: white, isActive: false),
          // Specification(title: "sts4".tr, color: red, isActive: false),
          // Specification(title: "sts5".tr, color: red, isActive: false),
        ]);
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
    addtoFinalNameList();
    finalNameList.shuffle();
    firstDivideRolesList.clear();
    firstDivideRolesList.addAll(selectedRoles);
    firstDivideRolesList.shuffle();
    manualDividerList.clear();
    gameList.clear();
    update();
  }

  // startSpeack() {
  //   String name = gameList
  // }
  changeShowRoleValue() {
    showRole.value = !showRole.value;

    update();
  }

  Timer? timerRun;
  startTimer() {
    const onSec = Duration(seconds: 1);

    if (!timerIsRunning.value) {
      timerDuration.value--;
      timerIsRunning.value = true;
      timerRun = Timer.periodic(onSec, (timer) {
        if (timerIsRunning.value) {
          if (timerDuration.value == 0) {
            timer.cancel();
            timerDuration.value = setTimerDuration.value;
            timerIsRunning.value = false;
            playAudio(SoundConstants.alarm);
          } else {
            timerDuration.value--;
          }
        } else {
          timer.cancel();
          timerIsRunning.value = false;
        }
      });
    } else {
      timerRun!.cancel();
      timerDuration.value = setTimerDuration.value;
      timerIsRunning.value = false;
    }
  }

  changeStatus(GameModel player, int index) {
    if (index == 0 || index == 1) {
      print(index == 0 || index == 1);
      if (index == 0) {
        player.specification![0]["isActive"] =
            !player.specification![0]["isActive"];
        player.specification![1]["isActive"] = false;
      } else {
        player.specification![1]["isActive"] =
            !player.specification![1]["isActive"];
        player.specification![0]["isActive"] = false;
      }
    } else if (index == 4 || index == 5) {
      print(index == 4 || index == 5);
      if (index == 4) {
        player.specification![4]["isActive"] =
            !player.specification![4]["isActive"];
        player.specification![5]["isActive"] = false;
      } else {
        player.specification![5]["isActive"] =
            !player.specification![5]["isActive"];
        ;
        player.specification![4]["isActive"] = false;
      }
    } else {
      player.specification![index]["isActive"] =
          !player.specification![index]["isActive"]!;
    }

    update();
  }

  chnageImmortalValue(GameModel player) {
    player.isImmortal = !player.isImmortal!;
    update();
  }

  resetRolePage() {
    selectedRoles.clear();

    citizenPickedCounter.value = 0;
    mafiaPickedCounter.value = 0;
    independentPickedCounter.value = 0;
    selectedRoleLength.value = 0;
    update();
  }
}
