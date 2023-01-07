import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';

class BtnWidget extends StatelessWidget {
  String? title;
  double? widthSize;
  double? heightSize;
  Color? fillColor;
  Color? textColor;
  Color? borerColor;
  double? borderRadius;
  double? fontSize;
  double? margin;
  Function()? onPress;
  BtnWidget(
      {Key? key,
      this.title = "کلیک",
      this.widthSize = 250,
      this.heightSize = 50,
      this.fillColor,
      this.textColor = white,
      this.borerColor = grey,
      this.borderRadius = 5,
      this.fontSize = 20,
      this.margin = 0,
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
        margin: EdgeInsets.all(margin!),
        width: widthSize,
        height: heightSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: fillColor,
            border: Border.all(color: borerColor!),
            borderRadius: BorderRadius.circular(borderRadius!)),
        child: FittedBox(
          child: Text(
            title!,
            style: TextStyle(
                fontSize: fontSize,
                color: textColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
