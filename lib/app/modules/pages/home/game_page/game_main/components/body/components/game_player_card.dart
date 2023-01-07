import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/pages/home/game_page/game_main/components/body/components/game_player_card_components/cheek_box.dart';
import 'package:mafia2/app/modules/pages/home/game_page/game_main/components/body/components/game_player_card_components/name_and_status.dart';

import '../../../../../../../controller/home_controller.dart';
import '../../../../../../widgets/btn_widgets.dart';
import 'game_player_card_components/role.dart';

class GamePlayerCard extends StatelessWidget {
  const GamePlayerCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<HomeController>(
        builder: ((controller) => Theme(
              data: ThemeData(
                  canvasColor: white.withOpacity(0.1), fontFamily: "Vazir"),
              child: ReorderableListView(
                onReorder: (oldIndex, newIndex) {
                  controller.reorderPlayerList(oldIndex, newIndex);
                },
                children: [
                  ...controller.gameList.map((e) {
                    return InkWell(
                      key: ValueKey(e),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 2),
                        height: Get.height * 0.05,
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            controller.showRole.value
                                ? Role(e: e)
                                : Container(),
                            NameAndStatus(
                              e: e,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            PlayerCheekBox(
                              e: e,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    );
                  })
                ],
              ),
            )),
      ),
    );
  }
}
