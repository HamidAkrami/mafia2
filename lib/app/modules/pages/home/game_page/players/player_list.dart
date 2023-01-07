import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';

import 'package:mafia2/app/modules/pages/widgets/app_textfield.dart';
import 'package:mafia2/app/modules/pages/widgets/btn_widgets.dart';
import 'package:mafia2/app/modules/pages/widgets/icon_btn_widget.dart';

import 'components/add_player_widget.dart';
import 'components/player_card.dart';
import 'components/player_list_header.dart';
import 'components/selected_players_bar.dart';

class PlayerList extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  PlayerList({Key? key}) {
    homeCtrl.getSelectedPlayers();
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return SafeArea(
        child: Scaffold(
      backgroundColor: grey.withOpacity(0.15),
      body: Column(
        children: [
          PlayerListHeader(),
          Expanded(
              child: GetBuilder<HomeController>(
            builder: (controller) => ListView(
              children: [
                ...controller.playerList.map((element) {
                  int index = controller.playerList.indexOf(element);
                  return PlayerCard(
                    player: element,
                    index: index,
                  );
                })
              ],
            ),
          )),
          AddPlayerWidget(homeCtrl: homeCtrl),
          const SizedBox(
            height: 5,
          ),
          !isKeyboard ? SelectedPlayersBar(homeCtrl: homeCtrl) : Container()
        ],
      ),
    ));
  }
}
