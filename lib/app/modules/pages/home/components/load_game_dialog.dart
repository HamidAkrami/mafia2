import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/widgets/btn_widgets.dart';
import 'package:mafia2/app/modules/routes/app_routes.dart';

class LoadGameDialog extends StatelessWidget {
  LoadGameDialog({
    Key? key,
  }) : super(key: key);
  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: Get.height * 0.2,
        color: Color.fromARGB(255, 39, 39, 39),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              "ttl10".tr,
              style: TextStyle(
                  color: white,
                  fontWeight: FontWeight.bold,
                  fontSize: getSize(20)),
            ),
            const Expanded(child: SizedBox()),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: BtnWidget(
                    onPress: () {
                      Get.toNamed(AppRoutes.setting);
                    },
                    title: "optn11".tr,
                    fillColor: greenDark,
                    heightSize: Get.height * 0.08,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: BtnWidget(
                    onPress: () {
                      homeCtrl.loadGame();
                      Get.toNamed(AppRoutes.gameMainPage);
                    },
                    title: "optn10".tr,
                    fillColor: blueDark,
                    heightSize: Get.height * 0.08,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
