import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/data/models/lists.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';

import 'chosen_role_cart.dart';

class RolesGridView extends StatelessWidget {
  RolesGridView({Key? key, this.side, this.size}) : super(key: key);
  int? side;
  double? size;
  final homeCtrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: size,
        child: GridView(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3.5),
          children: [
            ...homeCtrl.roleList
                .where((element) => element.isMafia == side)
                .toList()
                .map((e) => GetBuilder<HomeController>(
                      builder: (controller) => ChosenRoleCart(
                        role: e,
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
