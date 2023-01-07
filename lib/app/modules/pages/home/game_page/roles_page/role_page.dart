import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/data/models/lists.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';

import '../../../widgets/btn_widgets.dart';
import 'package:get/get.dart';

import '../../../widgets/icon_btn_widget.dart';
import 'components/role_page_side_title.dart';
import 'components/roles_gridview.dart';
import 'components/selected_roles_bar.dart';

class RolePage extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  RolePage({Key? key}) {
    homeCtrl.addToRoleList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: grey.withOpacity(0.15),
      body: Column(
        children: [
          BtnWidget(
            title: "ttl7".tr,
            heightSize: Get.height * 0.08,
            widthSize: Get.width,
            borderRadius: 0,
            borerColor: Colors.transparent,
            fontSize: getSize(15.0),
            fillColor: white.withOpacity(
              0.01,
            ),
          ),
          Expanded(
              child: GetBuilder<HomeController>(
            builder: (controller) => ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                //citizenSide
                RolePageSideTitle(
                    title: "bdy2".tr,
                    side: 0,
                    counter: controller.citizenPickedCounter.value),
                RolesGridView(
                  side: 0,
                  size: Get.height * 0.3,
                ),
                //mafiaSide
                RolePageSideTitle(
                    title: "bdy3".tr,
                    side: 1,
                    counter: homeCtrl.mafiaPickedCounter.value),
                RolesGridView(
                  side: 1,
                  size: Get.height * 0.18,
                ),
                RolePageSideTitle(
                    title: "bdy4".tr,
                    side: 2,
                    counter: homeCtrl.independentPickedCounter.value),
                RolesGridView(
                  side: 2,
                  size: Get.height * 0.1,
                ),
              ],
            ),
          )),
          SelectedRolesBar()
        ],
      ),
    ));
  }
}
