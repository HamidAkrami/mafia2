import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';

class AppTextField extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  AppTextField({Key? key, this.text, this.warning, this.inputController})
      : super(key: key);
  String? text;
  String? warning;
  TextEditingController? inputController;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        validator: ((value) {
          if (value == null || value.trim().isEmpty) {
            return warning;
          }
          return null;
        }),
        maxLength: 10,
        controller: inputController,
        style: TextStyle(color: white),
        cursorColor: greenDark,
        decoration: InputDecoration(
          counterText: "",
          contentPadding: EdgeInsetsDirectional.only(bottom: 15, start: 12),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: white.withOpacity(0.6))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: white.withOpacity(0.6))),
          labelStyle: TextStyle(
              color: white.withOpacity(0.7),
              fontSize: 16,
              fontWeight: FontWeight.w500),
          labelText: text,
        ),
      ),
    );
  }
}
