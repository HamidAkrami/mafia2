import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/core/value/icon_constants.dart';
import 'package:mafia2/app/core/value/sound_constants.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'package:mafia2/app/modules/pages/widgets/btn_widgets.dart';
import 'package:mafia2/app/modules/pages/widgets/svg_btn_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TimerDialog extends StatelessWidget {
  TimerDialog({
    Key? key,
  }) : super(key: key);

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(255, 37, 37, 37)),
          height: Get.height * 0.3,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LinearPercentIndicator(
                  padding: const EdgeInsets.all(0),
                  width: Get.width * 0.75,
                  lineHeight: 4,
                  percent: homeCtrl.timerDuration.value /
                      homeCtrl.setTimerDuration.value,
                  progressColor: greenDark,
                  backgroundColor: Colors.transparent),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                            "${homeCtrl.timerDuration.value}",
                            style:
                                TextStyle(fontSize: getSize(80), color: white),
                          ),
                          Text(
                            "sub0".tr,
                            style: const TextStyle(
                                color: white, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              BtnWidget(
                                onPress: () {
                                  homeCtrl.setTimerDuration.value = 15;
                                  homeCtrl.timerDuration.value =
                                      homeCtrl.setTimerDuration.value;
                                },
                                borerColor:
                                    homeCtrl.setTimerDuration.value == 15
                                        ? yellow
                                        : white.withOpacity(0.8),
                                heightSize: Get.height * 0.08,
                                title: "15",
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              BtnWidget(
                                onPress: () {
                                  homeCtrl.setTimerDuration.value = 30;
                                  homeCtrl.timerDuration.value =
                                      homeCtrl.setTimerDuration.value;
                                },
                                borerColor:
                                    homeCtrl.setTimerDuration.value == 30
                                        ? yellow
                                        : white.withOpacity(0.8),
                                heightSize: Get.height * 0.08,
                                title: "30",
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              BtnWidget(
                                onPress: () {
                                  homeCtrl.setTimerDuration.value = 45;
                                  homeCtrl.timerDuration.value =
                                      homeCtrl.setTimerDuration.value;
                                },
                                borerColor:
                                    homeCtrl.setTimerDuration.value == 45
                                        ? yellow
                                        : white.withOpacity(0.8),
                                heightSize: Get.height * 0.08,
                                title: "45",
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              BtnWidget(
                                onPress: () {
                                  homeCtrl.setTimerDuration.value = 60;
                                  homeCtrl.timerDuration.value =
                                      homeCtrl.setTimerDuration.value;
                                },
                                borerColor:
                                    homeCtrl.setTimerDuration.value == 60
                                        ? yellow
                                        : white.withOpacity(0.8),
                                heightSize: Get.height * 0.08,
                                title: "60",
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * 0.03,
                  ),
                  SvgBtnWidget(
                      onPress: () => homeCtrl.playAudio(SoundConstants.alarm),
                      svgAsset: IconConstants.alarm,
                      borderColor: yellow,
                      padding: 10),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Obx(
                    () => SvgBtnWidget(
                      onPress: () => homeCtrl.startTimer(),
                      borderColor: greenDark,
                      padding: 10,
                      svgAsset: homeCtrl.timerIsRunning.value
                          ? IconConstants.pause
                          : IconConstants.play,
                    ),
                  )),
                  SizedBox(
                    width: Get.width * 0.03,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }
}

class SetTimer extends StatelessWidget {
  SetTimer({Key? key, this.time, this.color, this.widthSize, this.onPress})
      : super(key: key);
  int? time;
  Color? color;
  double? widthSize;
  Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPress != null) {
          onPress!();
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: Get.height * 0.1,
        width: Get.width * 0.15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color!, width: widthSize!),
            color: Colors.transparent),
        child: Text(
          "$time",
          style: TextStyle(color: white, fontSize: getSize(22)),
        ),
      ),
    );
  }
}
