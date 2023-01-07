import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/data/models/players_model.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';

import '../../../../../../core/value/icon_constants.dart';

import '../../../../widgets/btn_widgets.dart';
import '../../../../widgets/image_btn_widget.dart';

// ignore: must_be_immutable
class PlayerCard extends StatelessWidget {
  PlayerCard({Key? key, this.player, this.index}) : super(key: key);
  final homeCtrl = Get.find<HomeController>();

  PlayersModel? player;
  int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.07,
      color: white.withOpacity(0.05),
      margin: const EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            Text(
              "${index! + 1} - ",
              style: TextStyle(color: white, fontSize: getSize(16.0)),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 3),
                alignment: Alignment.centerRight,
                height: Get.width * 0.11,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    player!.name!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: white,
                        fontSize: getSize(16.0),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            ImageBtnWidget(
              widthSize: Get.width * 0.13,
              heightSize: Get.height * 0.05,
              borderColor: redDark,
              imageIcon: IconConstants.remove,
              onPress: () => homeCtrl.removePlayer(player!),
              fillColor: redDark.withOpacity(0.1),
              imageColor: redDark,
            ),
            const SizedBox(
              width: 12,
            ),
            //player add widget
            homeCtrl.playerList[index!].isPlay!
                ? ImageBtnWidget(
                    imageIcon: IconConstants.done,
                    widthSize: Get.width * 0.23,
                    heightSize: Get.height * 0.05,
                    fillColor: greenDark.withOpacity(0.1),
                    borderColor: greenDark,
                    onPress: () {
                      homeCtrl.changePlayerValue(player!);
                      homeCtrl.getSelectedPlayers();
                    },
                  )
                : BtnWidget(
                    onPress: () {
                      homeCtrl.changePlayerValue(player!);
                      homeCtrl.getSelectedPlayers();
                    },
                    //choose
                    title: "optn7".tr,
                    fillColor: greenDark,
                    widthSize: Get.width * 0.23,
                    heightSize: Get.height * 0.05,
                    fontSize: getSize(16.0),
                    borderRadius: 8,
                  ),
          ],
        ),
      ),
    );
  }
}
