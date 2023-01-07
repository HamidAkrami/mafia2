import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/home/game_page/divide_page/components/end_divide_widget.dart';
import 'package:mafia2/app/modules/pages/home/game_page/divide_page/components/manual/components/show_role_rap.dart';

class DividerBody extends StatelessWidget {
  DividerBody({
    Key? key,
  }) : super(key: key);
  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: homeCtrl.manualDividerList.isNotEmpty
            ? ShowRoleWrap()
            : EndDivideWIdget());
  }
}
