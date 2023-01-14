import 'package:flutter/material.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/widgets/icon_btn_widget.dart';
import 'package:mafia2/app/modules/routes/app_routes.dart';
import '../../../widgets/btn_widgets.dart';
import 'package:get/get.dart';
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
          Container(
            height: Get.height * 0.08,
            color: white.withOpacity(0.01),
            child: Row(
              children: [
                Expanded(
                    child: IconBtnWidget(
                  fillColor: Colors.transparent,
                  btnIcon: Icons.info,
                  iconColor: white,
                  iconSize: Get.height * 0.04,
                  onPress: () {
                    Get.toNamed(AppRoutes.presentation);
                  },
                )),
                Expanded(
                  flex: 3,
                  child: BtnWidget(
                    title: "ttl7".tr,
                    borderRadius: 0,
                    borerColor: Colors.transparent,
                    fontSize: getSize(15.0),
                    fillColor: white.withOpacity(
                      0.01,
                    ),
                  ),
                ),
                Expanded(child: Container())
              ],
            ),
          ),
          Expanded(
              child: GetBuilder<HomeController>(
            builder: (controller) => ListView(
              physics: NeverScrollableScrollPhysics(),
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
                  size: Get.height * 0.18,
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
                  size: Get.height * 0.18,
                ),
              ],
            ),
          )),
          //choose Last Move Card

          SelectedRolesBar()
        ],
      ),
    ));
  }
}
