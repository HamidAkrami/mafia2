import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/home/game_page/divide_page/components/random/components/random_divider_body.dart';
import 'package:mafia2/app/modules/pages/home/game_page/divide_page/components/random/random_divider.dart';

import '../../../widgets/btn_widgets.dart';
import 'components/divider_botton_bar.dart';
import 'components/manual/manual_divider_page.dart';

class DividePage extends StatelessWidget {
  DividePage({Key? key}) : super(key: key);
  final homeCtrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: grey.withOpacity(0.15),
      body: Column(
        children: [
          BtnWidget(
            title: "ttl8".tr,
            heightSize: Get.height * 0.08,
            widthSize: Get.width,
            borderRadius: 0,
            borerColor: Colors.transparent,
            fontSize: getSize(15.0),
            fillColor: white.withOpacity(
              0.01,
            ),
          ),
          Expanded(
              child: homeCtrl.roleDistribution.value == 0
                  ? RandomDividerGridview()
                  : ManualDividerRole()),
          DividerBottonBar()
        ],
      ),
    ));
  }
}
