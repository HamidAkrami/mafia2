import 'package:flutter/material.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/data/models/game_model.dart';
import 'package:mafia2/app/modules/pages/widgets/btn_widgets.dart';

class Role extends StatelessWidget {
  Role({Key? key, this.e}) : super(key: key);
  GameModel? e;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: BtnWidget(
            title: e!.role,
            textColor: e!.isRemove!
                ? grey
                : e!.isMafia == 0
                    ? blueDark.withOpacity(0.7)
                    : e!.isMafia == 1
                        ? redDark.withOpacity(0.7)
                        : yellow.withOpacity(0.7),
            fontSize: getSize(14.0),
            borerColor: e!.isRemove!
                ? grey
                : e!.isMafia == 0
                    ? blueDark.withOpacity(0.7)
                    : e!.isMafia == 1
                        ? redDark.withOpacity(0.7)
                        : yellow.withOpacity(0.7),
          ),
        ));
  }
}
