import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mafia2/app/core/value/colors.dart';

class IconBtnWidget extends StatelessWidget {
  double? heightSize;
  double? widthSize;
  Color? fillColor;
  Color? iconColor;
  Color? borderColor;
  IconData? btnIcon;
  double? iconSize;
  double? borderRadius;
  Function()? onPress;
  IconBtnWidget(
      {Key? key,
      this.heightSize = 50,
      this.widthSize = 50,
      this.fillColor = white,
      this.iconColor = black,
      this.borderColor = Colors.transparent,
      this.btnIcon = Icons.add,
      this.iconSize = 35,
      this.borderRadius = 5,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPress != null) {
          onPress!();
        }
      },
      child: Container(
        height: heightSize,
        width: widthSize,
        decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: borderColor!)),
        child: Icon(
          btnIcon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
