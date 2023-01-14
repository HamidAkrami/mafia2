import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/data/models/lists.dart';
import 'package:mafia2/app/modules/routes/app_routes.dart';

import '../../../../../../core/utils/size.dart';
import '../../../../../controller/home_controller.dart';

import '../../../../widgets/icon_btn_widget.dart';

class SelectedPlayersBar extends StatelessWidget {
  const SelectedPlayersBar({
    Key? key,
    required this.homeCtrl,
  }) : super(key: key);

  final HomeController homeCtrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.07,
      color: white.withOpacity(0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      //players counter
                      "sub1".tr,
                      style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: getSize(16.0)),
                    ),
                    Obx(
                      () => Text(
                        " ${homeCtrl.selectedPlayers.value}",
                        style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: getSize(16.0)),
                      ),
                    )
                  ],
                ),
              )),
          IconBtnWidget(
            onPress: () {
              homeCtrl.addtoPlayerNameList();
              homeCtrl.resetRolePage();

              Get.toNamed(AppRoutes.rolePage);
            },
            widthSize: Get.width * 0.15,
            heightSize: Get.height * 0.06,
            borderColor: white.withOpacity(0.3),
            btnIcon: Icons.arrow_forward,
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
}
