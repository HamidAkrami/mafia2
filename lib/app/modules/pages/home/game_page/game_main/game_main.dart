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

import 'components/body/body_page.dart';
import 'components/header/main_page_header.dart';

class GameMain extends StatelessWidget {
  GameMain({Key? key}) : super(key: key);
  final homeCtrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: grey.withOpacity(0.15),
      body: Column(
        children: [
          MainPageHeader(),
          Expanded(
            child: GamePageBody(),
          ),
          Container(
            height: Get.height * 0.08,
            decoration: BoxDecoration(color: white.withOpacity(0.1)),
          )
        ],
      ),
    ));
  }
}
