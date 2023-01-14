import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/data/models/role_model.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/home/game_page/roles_page/components/simple_role.dart';

class ChosenRoleCart extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  ChosenRoleCart({
    this.role,
    Key? key,
  });
  RoleModel? role;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        homeCtrl.changePickValue(role!);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: grey.withOpacity(0.6)),
            color: !role!.isPicked!
                ? grey.withOpacity(0.2)
                : role!.isMafia == 0
                    ? blueDark
                    : role!.isMafia == 1
                        ? redDark
                        : yellow.withAlpha(150)),
        child: role!.id == 1 || role!.id == 16
            ? !role!.isPicked!
                ? Text(
                    role!.role!,
                    style: TextStyle(
                        color: white,
                        fontSize: getSize(14.0),
                        fontWeight: FontWeight.bold),
                  )
                : SImpleRole(role: role, homeCtrl: homeCtrl)
            : Text(
                role!.role!,
                style: TextStyle(
                    color: white,
                    fontSize: getSize(14.0),
                    fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
