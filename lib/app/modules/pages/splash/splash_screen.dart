// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/core/value/image_constants.dart';
import 'package:mafia2/app/modules/routes/app_routes.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  SplashScreen({
    Key? key,
  }) : super(key: key) {
    stratTimer();
  }

  stratTimer() {
    Timer? timer;
    int timerDuration = 4;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerDuration == 0) {
        Get.offAndToNamed(AppRoutes.homePage);
        timer.cancel();
      } else {
        timerDuration--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Image.asset(
        ImageConstant.splashScreen,
        fit: BoxFit.fill,
        width: Get.width,
        height: Get.height,
      ),
    );
  }
}
