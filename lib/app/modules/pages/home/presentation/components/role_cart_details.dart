import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';

import '../../../../../data/models/role_model.dart';

class RoleCartDetails extends StatelessWidget {
  const RoleCartDetails({
    Key? key,
    required this.role,
  }) : super(key: key);

  final RoleModel? role;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        height: Get.height * 0.7,
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: Get.width * 0.7,
              child: Image.asset(
                role!.image!,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              role!.role!,
              style: TextStyle(
                  color: role!.isMafia == 3
                      ? greenDark.withOpacity(0.9)
                      : role!.isMafia == 2
                          ? yellow.withOpacity(0.9)
                          : role!.isMafia == 0
                              ? blueDark.withOpacity(0.9)
                              : redDark.withOpacity(0.9),
                  fontWeight: FontWeight.bold,
                  fontSize: getSize(20.0)),
            ),
            Text(
              role!.isMafia == 3
                  ? ""
                  : role!.isMafia == 2
                      ? "(شخصیت مستقل)"
                      : role!.isMafia == 0
                          ? "(گروه شهروند)"
                          : "(گروه مافیا)",
              style: TextStyle(
                  color: role!.isMafia == 2
                      ? yellow.withOpacity(0.9)
                      : role!.isMafia == 0
                          ? blueDark.withOpacity(0.9)
                          : redDark.withOpacity(0.9),
                  fontWeight: FontWeight.bold,
                  fontSize: getSize(14.0)),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                  child: Text(
                    role!.description!,
                    style: TextStyle(color: white, fontSize: getSize(18.0)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
