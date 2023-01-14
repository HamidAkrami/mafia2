import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/pages/home/game_page/game_main/components/body/day/components/statistics_bar.dart';

import 'components/day_game_player_card.dart';
import 'components/tools_bar.dart';

class Day extends StatelessWidget {
  const Day({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatisticsBar(),
        const SizedBox(
          height: 5,
        ),
        DayGamePlayerCard(),
        ToolsBar()
      ],
    );
  }
}
