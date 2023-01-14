import 'dart:ffi';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/core/value/icon_constants.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/widgets/btn_widgets.dart';
import 'package:mafia2/app/modules/pages/widgets/image_btn_widget.dart';
import 'package:mafia2/app/modules/pages/widgets/svg_btn_widget.dart';
import 'package:mafia2/app/modules/routes/app_routes.dart';

import 'components/body/body_page.dart';
import 'components/close_dialog.dart';
import 'components/footer/game_time_bar.dart';
import 'components/header/main_page_header.dart';

class GameMain extends StatelessWidget {
  GameMain({Key? key}) : super(key: key);
  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showCupertinoDialog(
            barrierDismissible: true,
            context: context,
            builder: (_) {
              return CloseDIalog();
            });
        return true;
      },
      child: SafeArea(
          child: Scaffold(
        backgroundColor: grey.withOpacity(0.15),
        body: Column(
          children: [
            MainPageHeader(),
            Expanded(
              child: GamePageBody(),
            ),
            GameTimeBar()
          ],
        ),
      )),
    );
  }
}
