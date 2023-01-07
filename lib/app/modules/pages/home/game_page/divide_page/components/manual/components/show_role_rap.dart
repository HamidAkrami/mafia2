import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';

import '../../../../../../../../data/models/game_model.dart';
import '../../../../../../widgets/btn_widgets.dart';
import '../../divided_role_dialog.dart';

class ShowRoleWrap extends StatelessWidget {
  ShowRoleWrap({
    Key? key,
  }) : super(key: key);

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        ...homeCtrl.manualDividerList.map((element) => BtnWidget(
              onPress: () {
                homeCtrl.manualAddToGameList(element);
                dividerDialog(context, homeCtrl.gameList.last);
              },
              margin: 15,
              heightSize: Get.height * 0.1,
              widthSize: Get.width * 0.25,
              fillColor: grey.withOpacity(0.3),
              borerColor: grey.withOpacity(0.9),
              borderRadius: 20,
              title: element.name,
              fontSize: getSize(20.0),
            ))
      ],
    );
  }

  dividerDialog(BuildContext ctx, GameModel player) {
    AwesomeDialog(
        context: ctx,
        dialogType: DialogType.noHeader,
        width: Get.width,
        animType: AnimType.scale,
        dialogBackgroundColor: const Color(0xff191919),
        body: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: DividedRoleDIalog(player: player),
        )).show();
  }
}
