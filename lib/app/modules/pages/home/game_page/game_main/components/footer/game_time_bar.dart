import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/core/value/icon_constants.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';

import 'components/game_time_column.dart';

class GameTimeBar extends StatelessWidget {
  GameTimeBar({
    Key? key,
  }) : super(key: key);
  final homeCtrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.09,
      decoration: BoxDecoration(color: white.withOpacity(0.1)),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GameTimeColumn(
              icon: homeCtrl.gameTime.value == 0
                  ? IconConstants.day
                  : IconConstants.notDay,
              title: "sub7".tr,
              iconColor: homeCtrl.gameTime.value == 0 ? white : grey,
              onPress: () {
                // homeCtrl.saveGame();
                homeCtrl.gameTime.value = 0;
              },
            ),
            GameTimeColumn(
              icon: homeCtrl.gameTime.value == 1
                  ? IconConstants.vote
                  : IconConstants.notvote,
              title: "sub8".tr,
              iconColor: homeCtrl.gameTime.value == 1 ? white : grey,
              onPress: () {
                // homeCtrl.saveGame();
                homeCtrl.gameTime.value = 1;
              },
            ),
            GameTimeColumn(
              icon: homeCtrl.gameTime.value == 2
                  ? IconConstants.night
                  : IconConstants.notnight,
              title: "sub9".tr,
              iconColor: homeCtrl.gameTime.value == 2 ? white : grey,
              onPress: () {
                // homeCtrl.saveGame();
                homeCtrl.gameTime.value = 2;
              },
            )
          ],
        ),
      ),
    );
  }
}
