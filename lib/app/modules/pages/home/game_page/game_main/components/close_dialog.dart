import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/widgets/btn_widgets.dart';
import 'package:mafia2/app/modules/routes/app_routes.dart';

import '../../../../../../data/service/storage/storage_service.dart';

class CloseDIalog extends StatelessWidget {
  CloseDIalog({
    Key? key,
  }) : super(key: key);
  final homeCtrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        color: Color.fromARGB(255, 43, 43, 43),
        height: Get.height * 0.18,
        width: Get.width * 0.75,
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              "ttl11".tr,
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
                      Get.offAllNamed(AppRoutes.homePage);
                      homeCtrl.roleList.clear();
                    },
                    title: "optn12".tr,
                    fillColor: greenDark,
                    heightSize: Get.height * 0.06,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: BtnWidget(
                    onPress: () {
                      Get.back();
                    },
                    title: "optn13".tr,
                    fillColor: redDark,
                    heightSize: Get.height * 0.06,
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
