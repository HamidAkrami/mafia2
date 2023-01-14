import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';

class GameTimeColumn extends StatelessWidget {
  GameTimeColumn(
      {Key? key, this.icon, this.title, this.onPress, this.iconColor})
      : super(key: key);
  String? icon;
  String? title;
  Function()? onPress;
  Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: Get.width * 0.33,
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: getSize(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(icon!),
            Text(
              title!,
              style: TextStyle(color: iconColor, fontSize: getSize(16.0)),
            )
          ],
        ),
      ),
    );
  }
}
