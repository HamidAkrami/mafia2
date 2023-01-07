import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mafia2/app/core/value/colors.dart';

class ImageBtnWidget extends StatelessWidget {
  double? heightSize;
  double? widthSize;
  Color? fillColor;
  Color? imageColor;
  IconData? btnIcon;
  String? imageIcon;
  double? iconSize;
  double? borderRadius;
  Color? borderColor;
  Function()? onPress;
  ImageBtnWidget(
      {Key? key,
      this.heightSize = 50,
      this.widthSize = 50,
      this.fillColor = white,
      this.imageColor = green,
      this.borderColor = Colors.transparent,
      this.btnIcon = Icons.add,
      this.imageIcon,
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
          child: Image.asset(imageIcon!, color: imageColor)),
    );
  }
}
