import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/value/colors.dart';
import '../../../../../controller/home_controller.dart';
import '../../../../widgets/app_textfield.dart';
import '../../../../widgets/icon_btn_widget.dart';

class AddPlayerWidget extends StatelessWidget {
  const AddPlayerWidget({
    Key? key,
    required this.homeCtrl,
  }) : super(key: key);

  final HomeController homeCtrl;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: white.withOpacity(0.05),
        height: Get.height * 0.09,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: AppTextField(
                  inputController: homeCtrl.textEditingController,
                  text: "lbl".tr,
                  warning: "lbl2".tr),
            ),
            const SizedBox(
              width: 10,
            ),
            IconBtnWidget(
              onPress: () {
                homeCtrl.addPlayer();
                homeCtrl.getSelectedPlayers();
              },
              fillColor: greenDark,
              iconColor: white,
              widthSize: 60,
            ),
          ],
        ),
      ),
    );
  }
}
