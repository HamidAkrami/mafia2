import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/core/value/icon_constants.dart';
import 'package:mafia2/app/core/value/sound_constants.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/home/game_page/game_main/components/body/day/components/tools_bar_details/custom_tools.dart';
import 'package:mafia2/app/modules/pages/home/game_page/game_main/components/body/day/components/tools_bar_details/timer_dialog.dart';

import '../../../../../../../widgets/svg_btn_widget.dart';

class ToolsBar extends StatelessWidget {
  ToolsBar({
    Key? key,
  }) : super(key: key);
  final homeCtrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.07,
      decoration: BoxDecoration(
          color: white.withOpacity(0.02),
          border: const Border.symmetric(
              horizontal: BorderSide(color: white, width: 0.2))),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          CustomTool(
            onPress: () {
              showTimerDialog(context);
            },
            icon: IconConstants.timer,
            title: "sub5".tr,
          ),
          const Expanded(child: SizedBox()),
          Row(
            children: [
              SvgBtnWidget(
                onPress: () {
                  homeCtrl.playAudio(SoundConstants.shot);
                },
                heightSize: Get.height * 0.05,
                padding: 8,
                borderRadius: 8,
                borderColor: red,
                svgAsset: IconConstants.gun,
              ),
              const SizedBox(
                width: 10,
              ),
              SvgBtnWidget(
                onPress: () {
                  homeCtrl.playAudio(SoundConstants.dryGun);
                },
                heightSize: Get.height * 0.05,
                padding: 8,
                borderRadius: 8,
                borderColor: white.withOpacity(0.6),
                svgAsset: IconConstants.drygun,
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          CustomTool(
            onPress: () {
              homeCtrl.playAudio(SoundConstants.alarm);
            },
            icon: IconConstants.alarm,
            title: "sub6".tr,
            textColor: yellow,
            borderColor: yellow,
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }

  showTimerDialog(ctx) {
    showCupertinoDialog(
        barrierDismissible: true,
        context: ctx,
        builder: (_) => Dialog(
            backgroundColor: Colors.transparent,
            child: TimerDialog())).then((value) {
      homeCtrl.timerIsRunning.value = false;
      homeCtrl.timerDuration.value = homeCtrl.setTimerDuration.value;
    });
  }
}
