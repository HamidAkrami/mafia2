import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/home/game_page/setting/setting_details/option_widget.dart';

import 'package:mafia2/app/modules/pages/widgets/btn_widgets.dart';
import 'package:mafia2/app/modules/routes/app_routes.dart';

class SettingPage extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: grey.withOpacity(0.15),
      body: Column(
        children: [
          BtnWidget(
            title: "head2".tr,
            heightSize: Get.height * 0.08,
            widthSize: Get.width,
            borderRadius: 0,
            borerColor: Colors.transparent,
            fontSize: getSize(15.0),
            fillColor: white.withOpacity(
              0.01,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          OptionWidget(
            title: "ttl4".tr,
            option1: "optn".tr,
            option2: "optn2".tr,
          ),
          Expanded(child: Container()),
          BtnWidget(
            onPress: () {
              Get.toNamed(AppRoutes.playerList);
            },
            title: "sub".tr,
            fillColor: greenDark,
            widthSize: Get.width * 0.96,
            heightSize: Get.width * 0.13,
            fontSize: getSize(20.0),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    ));
  }
}
