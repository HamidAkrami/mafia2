import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/data/models/game_model.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';

class DividedRoleDIalog extends StatelessWidget {
  DividedRoleDIalog({Key? key, this.player}) : super(key: key);
  final homeCtrl = Get.find<HomeController>();
  GameModel? player;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.6,
      width: Get.width,
      color: Colors.transparent,
      child: Column(
        children: [
          Image.asset(player!.image!),
          SizedBox(
            height: getSize(15.0),
          ),
          Text(
            "${player!.role}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getSize(22.0),
                color: player!.isMafia == 0
                    ? blueDark
                    : player!.isMafia == 1
                        ? redDark
                        : player!.isMafia == 2
                            ? yellow
                            : greenDark),
          ),
          SizedBox(
            height: getSize(5.0),
          ),
          Text(
            player!.isMafia == 0
                ? "(شهروند)"
                : player!.isMafia == 1
                    ? "(تیم مافیا)"
                    : player!.isMafia == 2
                        ? "(نقش مستقل)"
                        : "",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getSize(18.0),
                color: player!.isMafia == 0
                    ? blueDark
                    : player!.isMafia == 1
                        ? redDark
                        : player!.isMafia == 2
                            ? yellow
                            : greenDark),
          ),
          SizedBox(
            height: getSize(15.0),
          ),
          Container(
            height: Get.height * 0.2,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Text(
                player!.description!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: getSize(16.0), color: white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
