import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/core/value/icon_constants.dart';
import 'package:mafia2/app/data/models/game_model.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/home/game_page/game_main/components/body/day/components/day_game_player_card_components/player_specifiction.dart';

// ignore: must_be_immutable
class NameAndStatus extends StatelessWidget {
  NameAndStatus({Key? key, this.e}) : super(key: key);
  GameModel? e;
  final homeCtrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 4,
        child: GestureDetector(
          onTap: () {
            showCupertinoDialog(
                barrierDismissible: true,
                context: context,
                builder: (_) {
                  return PlayerSpecification(
                    e: e,
                  );
                });
          },
          child: Container(
            height: Get.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: e!.isRemove!
                    ? white.withOpacity(0.4)
                    : homeCtrl.showRole.value == false
                        ? white.withOpacity(0.1)
                        : e!.isMafia == 2
                            ? yellow.withOpacity(0.2)
                            : e!.isMafia == 0
                                ? blueDark.withOpacity(0.2)
                                : redDark.withOpacity(0.2)),
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    Container(
                        width: 2,
                        color: e!.specification![2]["isActive"]
                            ? yellow
                            : Colors.transparent),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        e!.name!,
                        style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: getSize(17)),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          e!.specification![3]["isActive"]!
                              ? Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child:
                                      SvgPicture.asset(IconConstants.silence))
                              : Container(),
                          e!.specification![4]["isActive"]!
                              ? Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: SvgPicture.asset(IconConstants.gun))
                              : e!.specification![5]["isActive"]!
                                  ? Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: SvgPicture.asset(
                                          IconConstants.drygun))
                                  : Container(),
                          e!.isWolf!
                              ? Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: SvgPicture.asset(IconConstants.wolf))
                              : Container(),
                          e!.id == 2 && !e!.isImmortal!
                              ? Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: SvgPicture.asset(IconConstants.shield))
                              : Container(),
                        ],
                      ),
                    )),
                    Container(
                      width: 2,
                      color: e!.specification![0]["isActive"]!
                          ? redDark
                          : e!.specification![1]["isActive"]!
                              ? greenDark
                              : Colors.transparent,
                    ),
                  ],
                )),
          ),
        ));
  }
}
