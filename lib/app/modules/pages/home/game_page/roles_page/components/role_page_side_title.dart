import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';

class RolePageSideTitle extends StatelessWidget {
  RolePageSideTitle({Key? key, this.side, this.counter, this.title})
      : super(key: key);

  int? side;
  int? counter;
  String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.06,
      color: grey.withOpacity(0.4),
      child: Row(
        children: [
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  "bdy".tr,
                  style: TextStyle(
                      color: side == 0
                          ? blueDark
                          : side == 1
                              ? redDark
                              : yellow,
                      fontSize: getSize(20.0)),
                ),
                Text(
                  " $counter",
                  style: TextStyle(
                      color: side == 0
                          ? blueDark
                          : side == 1
                              ? redDark
                              : yellow,
                      fontSize: getSize(20.0)),
                )
              ],
            ),
          )),
          Expanded(
              flex: 3,
              child: Text(
                title!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: side == 0
                      ? blueDark
                      : side == 1
                          ? redDark
                          : yellow,
                  fontSize: getSize(20.0),
                ),
              )),
          const Expanded(child: SizedBox())
        ],
      ),
    );
  }
}
