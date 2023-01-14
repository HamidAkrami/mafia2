import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/data/models/game_model.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/routes/app_routes.dart';

import '../../../../widgets/icon_btn_widget.dart';
import 'divided_role_dialog.dart';

class DividerBottonBar extends StatelessWidget {
  DividerBottonBar({
    Key? key,
  }) : super(key: key);
  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.07,
      color: white.withOpacity(0.05),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          IconBtnWidget(
            onPress: () => Get.back(),
            widthSize: Get.width * 0.15,
            heightSize: Get.height * 0.06,
            borderColor: white.withOpacity(0.3),
            btnIcon: Icons.arrow_back,
            iconColor: white,
            fillColor: white.withOpacity(0.1),
          ),
          Expanded(child: Container()),
          IconBtnWidget(
            onPress: () {
              homeCtrl.gameList.isNotEmpty
                  ? dividerDialog(context, homeCtrl.gameList.last)
                  : null;
            },
            widthSize: Get.width * 0.15,
            heightSize: Get.height * 0.06,
            borderColor: white.withOpacity(0.3),
            btnIcon: Icons.person_pin,
            iconColor: white,
            fillColor: white.withOpacity(0.1),
          ),
          Expanded(child: Container()),
          IconBtnWidget(
            onPress: () {
              homeCtrl.refreshDivider();
            },
            widthSize: Get.width * 0.15,
            heightSize: Get.height * 0.06,
            borderColor: white.withOpacity(0.3),
            btnIcon: Icons.refresh,
            iconColor: white,
            fillColor: white.withOpacity(0.1),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }

  dividerDialog(BuildContext ctx, GameModel player) {
    AwesomeDialog(
        context: ctx,
        dialogType: DialogType.noHeader,
        width: Get.width,
        animType: AnimType.scale,
        dialogBackgroundColor: const Color(0xff191919),
        body: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: DividedRoleDIalog(player: player),
        )).show();
  }
}
