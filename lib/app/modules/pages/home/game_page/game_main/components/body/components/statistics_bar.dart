import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';

class StatisticsBar extends StatelessWidget {
  StatisticsBar({
    Key? key,
  }) {
    homeCtrl.computingSideNum();
  }
  final homeCtrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.06,
      decoration: BoxDecoration(
          color: white.withOpacity(0.1),
          border: Border.symmetric(
              horizontal:
                  BorderSide(color: grey.withOpacity(0.8), width: 0.7))),
      child: Obx(
        () => Row(
          children: [
            Expanded(
                child: NumberOfSide(
              side: 0,
              all: homeCtrl.citizenPickedCounter.value,
              amount: homeCtrl.aliveCitizenIndex.value,
            )),
            Expanded(
                child: NumberOfSide(
              side: 2,
              all: homeCtrl.independentPickedCounter.value,
              amount: homeCtrl.aliveindependentIndex.value,
            )),
            Expanded(
                child: NumberOfSide(
              side: 1,
              all: homeCtrl.mafiaPickedCounter.value,
              amount: homeCtrl.aliveMafiaIndex.value,
            ))
          ],
        ),
      ),
    );
  }
}

class NumberOfSide extends StatelessWidget {
  NumberOfSide({
    Key? key,
    this.side,
    this.all,
    this.amount,
  }) : super(key: key);
  int? side;
  int? all;
  int? amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$amount/",
          style: TextStyle(
              color: side == 0
                  ? blueDark
                  : side == 1
                      ? redDark
                      : side == 2
                          ? yellow
                          : green,
              fontSize: getSize(
                15.0,
              ),
              fontWeight: FontWeight.bold),
        ),
        Text(
          "$all ",
          style: TextStyle(
              color: side == 0
                  ? blueDark
                  : side == 1
                      ? redDark
                      : side == 2
                          ? yellow
                          : green,
              fontSize: getSize(
                15.0,
              ),
              fontWeight: FontWeight.bold),
        ),
        Text(
          side == 0
              ? "sub2".tr
              : side == 1
                  ? "sub4".tr
                  : side == 2
                      ? "sub3".tr
                      : "",
          style: TextStyle(
              color: side == 0
                  ? blueDark
                  : side == 1
                      ? redDark
                      : side == 2
                          ? yellow
                          : green,
              fontSize: getSize(
                15.0,
              ),
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
