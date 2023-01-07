import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:get/get.dart';

import '../../../widgets/btn_widgets.dart';

class MafiaScenario extends StatelessWidget {
  const MafiaScenario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: grey.withOpacity(0.15),
      body: Column(
        children: [
          BtnWidget(
            title: "ttl5".tr,
            heightSize: Get.height * 0.08,
            widthSize: Get.width,
            borderRadius: 0,
            borerColor: Colors.transparent,
            fontSize: getSize(20.0),
            fillColor: white.withOpacity(
              0.01,
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                Text(
                  "sen1".tr,
                  style: TextStyle(fontSize: getSize(16.0), color: white),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "sen2".tr,
                  style: TextStyle(fontSize: getSize(16.0), color: white),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "sen3".tr,
                  style: TextStyle(fontSize: getSize(16.0), color: white),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "sen4".tr,
                  style: TextStyle(fontSize: getSize(16.0), color: white),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "sen5".tr,
                  style: TextStyle(fontSize: getSize(16.0), color: white),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "sen6".tr,
                  style: TextStyle(fontSize: getSize(16.0), color: white),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "sen7".tr,
                  style: TextStyle(fontSize: getSize(16.0), color: white),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
