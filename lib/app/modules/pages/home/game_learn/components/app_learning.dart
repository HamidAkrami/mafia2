import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';

import '../../../widgets/btn_widgets.dart';
import 'package:get/get.dart';

class AppLearning extends StatelessWidget {
  const AppLearning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: grey.withOpacity(0.15),
      body: Column(
        children: [
          BtnWidget(
            title: "ttl6".tr,
            heightSize: Get.height * 0.08,
            widthSize: Get.width,
            borderRadius: 0,
            borerColor: Colors.transparent,
            fontSize: getSize(20.0),
            fillColor: white.withOpacity(
              0.01,
            ),
          ),
        ],
      ),
    ));
  }
}
