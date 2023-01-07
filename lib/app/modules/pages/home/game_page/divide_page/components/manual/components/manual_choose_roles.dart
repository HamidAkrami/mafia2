import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';

import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/pages/home/game_page/divide_page/components/manual/components/role_gridview.dart';

import '../../../../../../../controller/home_controller.dart';
import '../../../../../../widgets/btn_widgets.dart';

class ManualChooseRole extends StatelessWidget {
  ManualChooseRole({
    Key? key,
    this.controller,
  }) : super(key: key);
  final HomeController? controller;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...controller!.playerNameList.map((element) => Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              height: Get.height * 0.06,
              margin: const EdgeInsets.all(3),
              color: white.withOpacity(0.1),
              child: Row(
                children: [
                  const SizedBox(width: 30),
                  Text(
                    element,
                    style: TextStyle(
                        fontSize: getSize(20.0),
                        color: white,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: Container()),
                  BtnWidget(
                    onPress: () {
                      chooseManualRoleDialog(context, element);
                    },
                    heightSize: Get.height * 0.052,
                    widthSize: Get.width * 0.4,
                    fillColor: greenDark.withOpacity(0.3),
                    borerColor: greenDark,
                    title: "optn7".tr,
                    fontSize: getSize(15.0),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            )))
      ],
    );
  }

  chooseManualRoleDialog(ctx, String name) {
    AwesomeDialog(
        context: ctx,
        dialogType: DialogType.noHeader,
        padding: EdgeInsets.all(0),
        animType: AnimType.scale,
        dialogBackgroundColor: const Color(0xff191919),
        body: RolesGridview(
          name: name,
        )).show();
  }
}
