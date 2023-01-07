import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';

import '../../../../../controller/home_controller.dart';

// ignore: must_be_immutable
class OptionWidget extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  String? title;
  String? option1;
  String? option2;
  OptionWidget({
    this.title,
    this.option1,
    this.option2,
    Key? key,
  }) : super(key: key);
  int? index = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title!,
              style: TextStyle(
                fontSize: getSize(15.0),
                color: white,
              ),
            ),
            Obx(
              () => Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      homeCtrl.roleDistribution.value = 0;
                    },
                    child: Container(
                      height: Get.width * 0.12,
                      width: Get.width * 0.25,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: homeCtrl.roleDistribution.value == 1
                                  ? blueDark
                                  : blueDark.withOpacity(0.1)),
                          borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(4)),
                          color: homeCtrl.roleDistribution.value == 0
                              ? blueDark
                              : blueDark.withOpacity(0.1)),
                      alignment: Alignment.center,
                      child: Text(
                        option1!,
                        style: TextStyle(
                            fontSize: getSize(14.0),
                            color: white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      homeCtrl.roleDistribution.value = 1;
                    },
                    child: Container(
                      height: Get.width * 0.12,
                      width: Get.width * 0.25,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: homeCtrl.roleDistribution.value == 0
                                  ? blueDark
                                  : blueDark.withOpacity(0.1)),
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(4)),
                          color: homeCtrl.roleDistribution.value == 1
                              ? blueDark
                              : blueDark.withOpacity(0.1)),
                      alignment: Alignment.center,
                      child: Text(
                        option2!,
                        style: TextStyle(
                            fontSize: getSize(14.0),
                            color: white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
