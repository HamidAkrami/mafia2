import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/data/models/lists.dart';
import 'package:mafia2/app/data/models/role_model.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/home/presentation/components/role_cart_details.dart';

class RoleCart extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  RoleModel? role;
  RoleCart({Key? key, this.role}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        animatedDialog(context);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: role!.isMafia == 3
                  ? greenDark
                  : role!.isMafia == 2
                      ? yellow
                      : role!.isMafia == 0
                          ? blueDark
                          : redDark,
            ),
            color: role!.isMafia == 3
                ? greenDark.withOpacity(0.2)
                : role!.isMafia == 2
                    ? yellow.withOpacity(0.2)
                    : role!.isMafia == 0
                        ? blueDark.withOpacity(0.2)
                        : redDark.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Image.asset(
              role!.image!,
              height: Get.width * 0.3,
              width: Get.width * 0.2,
            ),
            Text(
              role!.role!,
              style: TextStyle(color: white, fontSize: getSize(18.0)),
            )
          ],
        ),
      ),
    );
  }

  animatedDialog(ctx) {
    AwesomeDialog(
            context: ctx,
            dialogType: DialogType.noHeader,
            width: Get.width,
            animType: AnimType.scale,
            dialogBackgroundColor: Color(0xff191919),
            borderSide: BorderSide(
              color: role!.isMafia == 3
                  ? greenDark.withOpacity(0.2)
                  : role!.isMafia == 2
                      ? yellow.withOpacity(0.2)
                      : role!.isMafia == 0
                          ? blueDark.withOpacity(0.2)
                          : redDark.withOpacity(0.2),
            ),
            body: RoleCartDetails(role: role))
        .show();
  }
}
