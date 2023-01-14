import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/core/value/icon_constants.dart';
import 'package:mafia2/app/data/models/game_model.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/widgets/svg_btn_widget.dart';

class PlayerCheekBox extends StatelessWidget {
  PlayerCheekBox({Key? key, this.e}) : super(key: key);
  GameModel? e;
  final homeCtrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        homeCtrl.changeRemoveValue(e!);
      },
      child: Container(
        width: Get.width * 0.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: e!.isRemove!
                    ? grey
                    : homeCtrl.showRole.value == false
                        ? white.withOpacity(0.6)
                        : e!.isMafia == 2
                            ? yellow
                            : e!.isMafia == 0
                                ? blueDark
                                : redDark)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: !e!.isRemove!
              ? Container()
              : SvgPicture.asset(IconConstants.dead),
        ),
      ),
    );
  }
}
