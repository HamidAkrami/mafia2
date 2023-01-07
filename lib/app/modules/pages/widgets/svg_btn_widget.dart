import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafia2/app/core/value/colors.dart';

class SvgBtnWidget extends StatelessWidget {
  double? heightSize;
  double? widthSize;
  Color? fillColor;
  Color? iconColor;
  Color? borderColor;
  String? svgAsset;
  double? iconSize;
  double? borderRadius;
  Function()? onPress;
  SvgBtnWidget(
      {Key? key,
      this.heightSize = 50,
      this.widthSize = 50,
      this.fillColor = white,
      this.iconColor = black,
      this.borderColor = Colors.transparent,
      this.svgAsset,
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
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: borderColor!)),
        child: SvgPicture.asset(
          svgAsset!,
        ),
      ),
    );
  }
}
