import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/widgets/btn_widgets.dart';

class removeAllPlayerDialog extends StatelessWidget {
  const removeAllPlayerDialog({
    Key? key,
    required this.homeCtrl,
  }) : super(key: key);

  final HomeController homeCtrl;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(255, 29, 28, 28),
        ),
        height: Get.width * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              // remove all?
              "msg".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: BtnWidget(
                  heightSize: Get.width * 0.11,
                  //no
                  title: "optn6".tr,
                  fillColor: redDark,
                  onPress: () => Get.back(),
                )),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                    child: BtnWidget(
                  heightSize: Get.width * 0.11,
                  //yes
                  title: "optn5".tr,
                  fillColor: greenDark,
                  onPress: () {
                    homeCtrl.removePlayerList();
                    homeCtrl.getSelectedPlayers();
                    Get.back();
                  },
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
