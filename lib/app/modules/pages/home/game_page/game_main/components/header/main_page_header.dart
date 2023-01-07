import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';

import '../../../../../../../core/value/icon_constants.dart';
import '../../../../../widgets/svg_btn_widget.dart';

class MainPageHeader extends StatelessWidget {
  MainPageHeader({
    Key? key,
  }) : super(key: key);

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.08,
      decoration: BoxDecoration(color: white.withOpacity(0.1)),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          SvgBtnWidget(
            onPress: () {},
            svgAsset: IconConstants.speaking,
            heightSize: Get.height * 0.035,
          ),
          Expanded(child: Container()),
          Obx(
            () => SvgBtnWidget(
              onPress: () {
                homeCtrl.changeShowRoleValue();
              },
              svgAsset: homeCtrl.showRole.value
                  ? IconConstants.show
                  : IconConstants.hide,
              heightSize: homeCtrl.showRole.value
                  ? Get.height * 0.03
                  : Get.height * 0.037,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
