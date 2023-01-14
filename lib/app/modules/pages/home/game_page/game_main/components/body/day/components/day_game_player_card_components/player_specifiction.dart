import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/data/models/game_model.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/widgets/btn_widgets.dart';

class PlayerSpecification extends StatelessWidget {
  PlayerSpecification({
    this.e,
    Key? key,
  }) {
    e!.id == 2 ? isImmortal = true : false;
  }
  bool isImmortal = false;
  GameModel? e;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 15),
      backgroundColor: Colors.transparent,
      child: GetBuilder<HomeController>(
        builder: (controller) => Container(
          height: Get.height * 0.4,
          color: const Color.fromARGB(255, 39, 39, 39),
          width: Get.width,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                "ttl9".tr,
                style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontSize: getSize(24)),
              ),
              Expanded(
                  child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                    mainAxisExtent: Get.height * 0.06),
                children: [
                  ...e!.specification!.map((element) {
                    int index = e!.specification!.indexOf(element);
                    return BtnWidget(
                      onPress: () {
                        controller.changeStatus(e!, index);
                      },
                      title: element["title"],
                      fillColor: element["isActive"]
                          ? element["color"]
                          : Colors.transparent,
                      borerColor: element["isActive"]
                          ? element["color"]
                          : Colors.white.withOpacity(0.3),
                    );
                  })
                ],
              )),
              isImmortal
                  ? BtnWidget(
                      onPress: () {
                        controller.chnageImmortalValue(e!);
                      },
                      margin: 10,
                      widthSize: Get.width,
                      fillColor: e!.isImmortal!
                          ? Colors.transparent
                          : Colors.deepPurple,
                      title: "sts6".tr,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
