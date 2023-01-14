import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';
import 'components/player_vote_list.dart';

class Vote extends StatelessWidget {
  Vote({Key? key}) : super(key: key);
  final homeCtrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlayerVoteList(),
      ],
    );
  }
}
