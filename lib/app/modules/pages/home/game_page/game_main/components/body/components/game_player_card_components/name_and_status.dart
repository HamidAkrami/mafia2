import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/data/models/game_model.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';

// ignore: must_be_immutable
class NameAndStatus extends StatelessWidget {
  NameAndStatus({Key? key, this.e}) : super(key: key);
  GameModel? e;
  final homeCtrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 4,
        child: GestureDetector(
          onTap: () {
            homeCtrl.changeStatus(e!);
          },
          child: Container(
            height: Get.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: e!.isRemove!
                    ? white.withOpacity(0.4)
                    : homeCtrl.showRole.value == false
                        ? white.withOpacity(0.1)
                        : e!.isMafia == 2
                            ? yellow.withOpacity(0.2)
                            : e!.isMafia == 0
                                ? blueDark.withOpacity(0.2)
                                : redDark.withOpacity(0.2)),
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    Container(
                      width: 2,
                      color: e!.yellowCart! ? yellow : Colors.transparent,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      e!.name!,
                      style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: getSize(17)),
                    )
                  ],
                )),
          ),
        ));
  }
}
