import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/routes/app_routes.dart';

import '../../widgets/btn_widgets.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BtnWidget(
          onPress: () {
            Get.toNamed(AppRoutes.setting);
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
