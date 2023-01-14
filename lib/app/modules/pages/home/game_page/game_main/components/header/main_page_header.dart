import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';

import '../../../../../../../core/value/icon_constants.dart';
import '../../../../../widgets/svg_btn_widget.dart';
import 'components/day_header.dart';

class MainPageHeader extends StatelessWidget {
  MainPageHeader({
    Key? key,
  }) : super(key: key);

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
          height: Get.height * 0.08,
          decoration: BoxDecoration(color: white.withOpacity(0.1)),
          child: homeCtrl.gameTime.value == 0
              ? DayHeader()
              : homeCtrl.gameTime.value == 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "head6".tr,
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: getSize(20)),
                        )
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(child: Container()),
                        Expanded(child: Container()),
                        Expanded(
                            child: GestureDetector(
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 10),
                            child: SvgBtnWidget(
                              heightSize: Get.height * 0.03,
                              svgAsset: IconConstants.nightmusic,
                            ),
                          ),
                        )),
                      ],
                    )),
    );
  }
}
