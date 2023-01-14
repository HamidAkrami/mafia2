import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        padding: const EdgeInsets.all(4),
        height: size,
        child: GridView(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: 0.35),
          children: [
            ...homeCtrl.roleList
                .where((element) => element.isMafia == side)
                .toList()
                .map((e) => ChosenRoleCart(
                      role: e,
                    ))
          ],
        ),
      ),
    );
  }
}
