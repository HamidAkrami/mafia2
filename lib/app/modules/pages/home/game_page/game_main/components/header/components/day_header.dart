import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../core/value/icon_constants.dart';
import '../../../../../../../controller/home_controller.dart';
import '../../../../../../widgets/svg_btn_widget.dart';

class DayHeader extends StatelessWidget {
  DayHeader({
    Key? key,
  }) : super(key: key);

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
