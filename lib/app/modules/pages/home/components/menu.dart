import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/routes/app_routes.dart';

import '../../widgets/btn_widgets.dart';
import 'load_game_dialog.dart';

class Menu extends StatelessWidget {
  Menu({
    Key? key,
  }) : super(key: key);
  final homeCtrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BtnWidget(
          onPress: () {
            print(homeCtrl.gameList.isNotEmpty);
            if (homeCtrl.gameList.isNotEmpty) {
              showCupertinoDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (_) {
                    return LoadGameDialog();
                  });
            } else {
              Get.toNamed(AppRoutes.setting);
            }
          },
          title: "ttl".tr,
          fillColor: greenDark,
          heightSize: Get.height * 0.07,
          fontSize: getSize(16.0),
        ),
        const SizedBox(
          height: 10,
        ),
        BtnWidget(
          onPress: () => Get.toNamed(AppRoutes.gameLearning),
          title: "ttl2".tr,
          fillColor: white.withOpacity(0.05),
          heightSize: Get.height * 0.07,
          fontSize: getSize(16.0),
        ),
        const SizedBox(
          height: 10,
        ),
        BtnWidget(
          onPress: () {
            Get.toNamed(AppRoutes.presentation);
          },
          heightSize: Get.height * 0.07,
          title: "ttl3".tr,
          fillColor: white.withOpacity(0.05),
          fontSize: getSize(16.0),
        ),
      ],
    );
  }
}
