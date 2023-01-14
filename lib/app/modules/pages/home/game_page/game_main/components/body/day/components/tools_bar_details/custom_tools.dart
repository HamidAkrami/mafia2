import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';

class CustomTool extends StatelessWidget {
  CustomTool(
      {Key? key,
      this.icon,
      this.title,
      this.onPress,
      this.textColor = white,
      this.borderColor = white})
      : super(key: key);
  String? icon;
  String? title;
  Color? borderColor;
  Function()? onPress;
  Color? textColor = white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPress != null) {
          onPress!();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            color: white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: borderColor!)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon!,
              height: Get.height * 0.025,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              title!,
              style: TextStyle(fontSize: getSize(20.0), color: textColor),
            )
          ],
        ),
      ),
    );
  }
}
