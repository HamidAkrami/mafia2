import 'package:flutter/material.dart';

import 'components/game_player_card.dart';
import 'components/statistics_bar.dart';

class GamePageBody extends StatelessWidget {
  const GamePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatisticsBar(),
        GamePlayerCard(),
      ],
    );
  }
}
