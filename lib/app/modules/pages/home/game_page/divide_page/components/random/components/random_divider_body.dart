import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';

import '../../../../../../../../data/models/game_model.dart';
import '../../divided_role_dialog.dart';

class RandomDividerBody extends StatelessWidget {
  RandomDividerBody({
    Key? key,
  }) : super(key: key);
  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          ...homeCtrl.playerNameList.map((element) => GestureDetector(
                onTap: () {
                  homeCtrl.addToGameList(element);
                  randomDividerDialog(context, homeCtrl.gameList.last);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: grey.withOpacity(0.9)),
                    color: grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.all(12),
                  width: Get.width * 0.25,
                  height: Get.height * 0.1,
                  alignment: Alignment.center,
                  child: Text(
                    element,
                    style: TextStyle(color: white, fontSize: getSize(20.0)),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  randomDividerDialog(BuildContext ctx, GameModel player) {
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
