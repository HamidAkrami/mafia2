import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/core/utils/size.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';

class PlayerVoteList extends StatelessWidget {
  PlayerVoteList({
    Key? key,
  }) : super(key: key);

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        ...homeCtrl.gameList
            .where((p0) => !p0.isRemove!)
            .toList()
            .map((e) => GestureDetector(
                  onTap: () {
                    showCupertinoDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (_) {
                          return Dialog(
                              backgroundColor: Colors.transparent,
                              insetPadding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 0),
                              child: Container(
                                height: Get.height * 0.6,
                                color: const Color.fromARGB(255, 37, 37, 37),
                                child: GridView(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                  ),
                                  children: [
                                    ...homeCtrl.gameList.map((element) {
                                      int index =
                                          homeCtrl.gameList.indexOf(element);
                                      return Container(
                                        alignment: Alignment.center,
                                        child: Text("$index"),
                                      );
                                    })
                                  ],
                                ),
                              ));
                        });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(3),
                    height: Get.height * 0.045,
                    decoration: BoxDecoration(
                        color: white.withOpacity(0.07),
                        border: Border.all(
                          color: white.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.circular(4)),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              e.name!,
                              style: TextStyle(
                                  color: white,
                                  fontSize: getSize(18),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(child: Container()),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "${e.voteCount}",
                              style: TextStyle(
                                  color: white,
                                  fontSize: getSize(18),
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ))
      ],
    ));
  }
}
