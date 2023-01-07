import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/data/models/game_model.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/widgets/btn_widgets.dart';

import '../end_divide_widget.dart';
import 'components/random_divider_body.dart';
import '../divider_botton_bar.dart';

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
          child: controller.playerNameList.isNotEmpty
              ? RandomDividerBody()
              : EndDivideWIdget()),
    );
  }
}
