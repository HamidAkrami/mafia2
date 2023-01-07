import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/home/components/menu.dart';
import 'package:mafia2/app/modules/pages/widgets/btn_widgets.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.15),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              BtnWidget(
                title: "head".tr,
                heightSize: Get.height * 0.08,
                widthSize: Get.width,
                borderRadius: 0,
                borerColor: Colors.transparent,
                fontSize: getSize(20.0),
                fillColor: white.withOpacity(
                  0.01,
                ),
              ),
              const Expanded(
                child: Menu(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
