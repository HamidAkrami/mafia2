import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/core/value/icon_constants.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/home/game_page/players/components/remove_player_dialog.dart';

import 'package:mafia2/app/modules/pages/widgets/icon_btn_widget.dart';
import 'package:mafia2/app/modules/pages/widgets/image_btn_widget.dart';

import '../../../../widgets/btn_widgets.dart';

class PlayerListHeader extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  PlayerListHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    openRemoveDialog() {
      showDialog(
          context: context,
          builder: (_) {
            return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: removeAllPlayerDialog(homeCtrl: homeCtrl));
          });
    }

//players page header :
    return Container(
      height: Get.height * 0.09,
      color: white.withOpacity(0.01),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                "head3".tr,
                style: TextStyle(
                    fontSize: getSize(15.0),
                    color: white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                BtnWidget(
                  onPress: () {
                    openRemoveDialog();
                  },
                  //delete all
                  title: "optn3".tr,
                  fillColor: red,
                  widthSize: Get.width * 0.23,
                  heightSize: Get.height * 0.05,
                  fontSize: getSize(14.0),
                  borderRadius: 8,
                ),
                const SizedBox(
                  width: 5,
                ),
                Obx(
                  () => homeCtrl.selectedAll.value
                      ? ImageBtnWidget(
                          //all players added
                          imageIcon: IconConstants.done,
                          widthSize: Get.width * 0.23,
                          heightSize: Get.height * 0.05,
                          fillColor: greenDark.withOpacity(0.1),
                          borderColor: greenDark,
                          onPress: () {
                            homeCtrl.selectAllPlayer();
                            homeCtrl.getSelectedPlayers();
                          },
                        )
                      : BtnWidget(
                          onPress: () {
                            homeCtrl.selectAllPlayer();
                            homeCtrl.getSelectedPlayers();
                          },
                          //chosen all
                          title: "optn4".tr,
                          fillColor: greenDark,
                          widthSize: Get.width * 0.23,
                          heightSize: Get.height * 0.05,
                          fontSize: getSize(14.0),
                          borderRadius: 8,
                        ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
