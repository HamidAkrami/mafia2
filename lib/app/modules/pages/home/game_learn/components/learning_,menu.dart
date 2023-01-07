import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/pages/widgets/btn_widgets.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/modules/routes/app_routes.dart';

class LearningMenu extends StatelessWidget {
  const LearningMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView(
      padding: EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.2, crossAxisCount: 2, crossAxisSpacing: 15),
      children: [
        // mafia scenario
        BtnWidget(
          onPress: () => Get.toNamed(AppRoutes.scenario),
          fillColor: greenDark,
          fontSize: getSize(20.0),
          title: "ttl5".tr,
        ),
        //app learning
        BtnWidget(
          onPress: () => Get.toNamed(AppRoutes.appLearning),
          fillColor: greenDark,
          fontSize: getSize(20.0),
          title: "ttl6".tr,
        )
      ],
    ));
  }
}
