import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/home/game_page/game_main/components/body/vote/vote.dart';

import 'day/day.dart';

class GamePageBody extends StatelessWidget {
  GamePageBody({
    Key? key,
  }) : super(key: key);
  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeCtrl.gameTime.value == 0
          ? Day()
          : homeCtrl.gameTime.value == 1
              ? Vote()
              : Container(),
    );
  }
}
