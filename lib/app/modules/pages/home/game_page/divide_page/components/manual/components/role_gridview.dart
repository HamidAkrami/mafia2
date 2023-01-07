import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';

import '../../../../../../widgets/btn_widgets.dart';

class RolesGridview extends StatelessWidget {
  RolesGridview({
    Key? key,
    this.name,
  }) : super(key: key);
  String? name;
  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        height: Get.height * 0.6,
        width: Get.width,
        color: Colors.transparent,
        child: GridView(
            padding: EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            children: [
              ...homeCtrl.firstDivideRolesList.map((element) => BtnWidget(
                    fillColor: element.isMafia == 0
                        ? blueDark.withOpacity(0.3)
                        : element.isMafia == 1
                            ? redDark.withOpacity(0.3)
                            : yellow.withAlpha(150).withOpacity(0.3),
                    borerColor: element.isMafia == 0
                        ? blueDark.withOpacity(0.9)
                        : element.isMafia == 1
                            ? redDark.withOpacity(0.9)
                            : yellow.withAlpha(150).withOpacity(0.9),
                    title: element.role,
                    fontSize: getSize(17.0),
                    onPress: () {
                      homeCtrl.manualDivider(name!, element);
                      Get.back();
                    },
                  ))
            ]),
      ),
    );
  }
}
