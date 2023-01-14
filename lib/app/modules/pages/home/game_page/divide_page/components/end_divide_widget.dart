import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/widgets/btn_widgets.dart';
import 'package:mafia2/app/modules/routes/app_routes.dart';

class EndDivideWIdget extends StatelessWidget {
  EndDivideWIdget({
    Key? key,
  }) : super(key: key);

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff191919),
          boxShadow: const [
            BoxShadow(
                color: grey,
                offset: Offset(0.5, 1),
                blurRadius: 3,
                blurStyle: BlurStyle.normal)
          ],
          borderRadius: BorderRadius.circular(15)),
      height: Get.height * 0.2,
      width: Get.width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "msg2".tr,
            style: TextStyle(
                color: white,
                fontSize: getSize(20.0),
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              const SizedBox(
                width: 25,
              ),
              //refresh
              Expanded(
                child: BtnWidget(
                  onPress: () => homeCtrl.refreshDivider(),
                  fontSize: getSize(16.0),
                  fillColor: redDark,
                  title: "optn9".tr,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              //go To Game
              Expanded(
                child: BtnWidget(
                  onPress: () {
                    homeCtrl.gameList.shuffle();
                    Get.toNamed(AppRoutes.gameMainPage);
                  },
                  fontSize: getSize(16.0),
                  fillColor: greenDark,
                  title: "optn8".tr,
                ),
              ),
              const SizedBox(
                width: 25,
              ),
            ],
          )
        ],
      ),
    );
  }
}
