import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/data/models/lists.dart';
import 'package:mafia2/app/modules/pages/home/presentation/components/role_cart.dart';
import 'package:mafia2/app/modules/pages/widgets/btn_widgets.dart';

class Presentation extends StatelessWidget {
  const Presentation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: grey.withOpacity(0.15),
      body: Column(children: [
        BtnWidget(
          borerColor: Colors.transparent,
          fillColor: white.withOpacity(
            0.01,
          ),
          borderRadius: 0,
          fontSize: getSize(15.0),
          heightSize: Get.height * 0.08,
          widthSize: Get.width,
          title: "head4".tr,
          textColor: white,
        ),
        Expanded(
            child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 0.75),
          children: [
            ...characterList.map((e) => RoleCart(
                  role: e,
                ))
          ],
        ))
      ]),
    ));
  }
}
