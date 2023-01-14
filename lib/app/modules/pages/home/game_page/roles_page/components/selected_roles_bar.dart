import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/routes/app_routes.dart';

import '../../../../../controller/home_controller.dart';
import '../../../../widgets/icon_btn_widget.dart';

class SelectedRolesBar extends StatelessWidget {
  SelectedRolesBar({
    Key? key,
  }) : super(key: key);

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.07,
      color: white.withOpacity(0.05),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          IconBtnWidget(
            onPress: () => Get.back(),
            widthSize: Get.width * 0.15,
            heightSize: Get.height * 0.06,
            borderColor: white.withOpacity(0.3),
            btnIcon: Icons.arrow_back,
            iconColor: white,
            fillColor: white.withOpacity(0.1),
          ),
          Expanded(
              child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${homeCtrl.selectedRoleLength.value}",
                    style: TextStyle(
                        color:
                            homeCtrl.isEqualLength.value ? greenDark : redDark,
                        fontSize: getSize(24))),
                Text(
                  "/${homeCtrl.playerNameList.length}",
                  style: TextStyle(
                      color: homeCtrl.isEqualLength.value ? greenDark : redDark,
                      fontSize: getSize(24)),
                )
              ],
            ),
          )),
          IconBtnWidget(
            onPress: () {
              cheekSelectedRoles(context);
              homeCtrl.addtoFinalNameList();
            },
            widthSize: Get.width * 0.15,
            heightSize: Get.height * 0.06,
            borderColor: white.withOpacity(0.3),
            btnIcon: Icons.arrow_forward,
            iconColor: white,
            fillColor: white.withOpacity(0.1),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }

  cheekSelectedRoles(BuildContext context) {
    homeCtrl.firstDivideRolesList.clear();
    homeCtrl.manualDividerList.clear();
    homeCtrl.gameList.clear();
    bool isEqual =
        homeCtrl.selectedRoleLength.value == homeCtrl.playerNameList.length;
    bool citizenisHigher =
        homeCtrl.citizenPickedCounter.value > homeCtrl.mafiaPickedCounter.value;
    if (isEqual && citizenisHigher) {
      homeCtrl.firstDivideRolesList.addAll(homeCtrl.selectedRoles);
      Get.toNamed(AppRoutes.divide);
    } else {
      showWarningDialog(context, isEqual, citizenisHigher);
    }
  }

  showWarningDialog(ctx, bool isEqual, bool citizenisHiger) {
    AwesomeDialog(
        context: ctx,
        dialogType: DialogType.noHeader,
        width: Get.width,
        animType: AnimType.scale,
        dialogBackgroundColor: Color(0xff191919).withOpacity(0.9),
        body: Container(
          height: Get.height * 0.2,
          alignment: Alignment.center,
          child: Text(
            !isEqual
                ? "!تعداد بازیکنان و نقش ها باید برابر باشد"
                : !citizenisHiger
                    ? "!تعداد شهروندان باید از مافیا بیشتر باشد"
                    : "",
            textAlign: TextAlign.center,
            style: TextStyle(color: redDark, fontSize: getSize(15)),
          ),
        )).show();
  }
}
