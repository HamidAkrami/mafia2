import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';

import '../end_divide_widget.dart';
import 'components/random_divider_body.dart';

class RandomDividerGridview extends StatelessWidget {
  RandomDividerGridview({
    Key? key,
  }) : super(key: key);

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
          alignment: Alignment.center,
          child: controller.finalNameList.isNotEmpty
              ? RandomDividerBody()
              : EndDivideWIdget()),
    );
  }
}
