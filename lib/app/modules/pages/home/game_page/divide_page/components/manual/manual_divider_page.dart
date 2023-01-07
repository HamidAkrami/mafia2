import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/home/game_page/divide_page/components/manual/components/manual_divider_body.dart';
import 'package:mafia2/app/modules/pages/widgets/btn_widgets.dart';

import 'components/manual_choose_roles.dart';
import 'components/role_gridview.dart';

class ManualDividerRole extends StatelessWidget {
  ManualDividerRole({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Container(
              alignment: Alignment.center,
              child: controller.playerNameList.isNotEmpty
                  ? ManualChooseRole(
                      controller: controller,
                    )
                  : DividerBody(),
            ));
  }
}
