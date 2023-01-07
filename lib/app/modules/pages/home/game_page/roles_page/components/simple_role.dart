import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';

import '../../../../../../data/models/role_model.dart';
import '../../../../../controller/home_controller.dart';

class SImpleRole extends StatelessWidget {
  SImpleRole({
    Key? key,
    required this.role,
    required this.homeCtrl,
  }) : super(key: key);

  final RoleModel? role;
  final HomeController homeCtrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            role!.role!,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: white,
                fontSize: getSize(14.0),
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Obx(
            () => GestureDetector(
              onTap: () {
                homeCtrl.increaseSimple(role!);
              },
              child: Container(
                alignment: Alignment.center,
                width: Get.width * 0.08,
                height: Get.height,
                color: white,
                child: Text(
                  role!.isMafia == 0
                      ? "${homeCtrl.simpleCitizen.value}"
                      : "${homeCtrl.simpleMafia.value}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: role!.isMafia == 0 ? blueDark : redDark,
                      fontSize: getSize(16.0)),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
