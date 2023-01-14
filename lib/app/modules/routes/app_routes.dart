import 'package:get/get.dart';
import 'package:mafia2/app/modules/binding/bindings.dart';
import 'package:mafia2/app/modules/pages/home/game_learn/components/app_learning.dart';
import 'package:mafia2/app/modules/pages/home/game_learn/components/scenario.dart';
import 'package:mafia2/app/modules/pages/home/game_page/divide_page/divide_page.dart';
import 'package:mafia2/app/modules/pages/home/game_page/game_main/game_main.dart';
import 'package:mafia2/app/modules/pages/home/home_page.dart';
import 'package:mafia2/app/modules/pages/home/presentation/presentation.dart';
import 'package:mafia2/app/modules/pages/splash/splash_screen.dart';
import '../pages/home/game_learn/game_learning.dart';
import '../pages/home/game_page/players/player_list.dart';
import '../pages/home/game_page/roles_page/role_page.dart';
import '../pages/home/game_page/setting/setting_page.dart';

class AppRoutes {
  static const String splashScreen = "/splashScreen";
  static const String homePage = "/homePage";
  static const String setting = "/setting";
  static const String playerList = "/playerList";
  static const String rolePage = "/rolePage";
  static const String presentation = "/presentation";
  static const String gameLearning = "/gameLearning";
  static const String scenario = "/scenario";
  static const String appLearning = "/appLearning";
  static const String divide = "/divide";
  static const String gameMainPage = "/gameMainPage";
  static const String lastMovePage = "/lastMovePage";
}

class App {
  static final pages = [
    GetPage(
      transition: Transition.rightToLeft,
      name: AppRoutes.homePage,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: AppRoutes.setting,
      page: () => SettingPage(),
      binding: HomeBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: AppRoutes.presentation,
      page: () => const Presentation(),
      binding: HomeBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: AppRoutes.gameLearning,
      page: () => const GameLearn(),
      binding: HomeBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: AppRoutes.scenario,
      page: () => const MafiaScenario(),
      binding: HomeBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: AppRoutes.appLearning,
      page: () => const AppLearning(),
      binding: HomeBinding(),
    ),
    GetPage(
      transition: Transition.leftToRight,
      name: AppRoutes.playerList,
      page: () => PlayerList(),
      binding: HomeBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: AppRoutes.rolePage,
      page: () => RolePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: AppRoutes.divide,
      page: () => DividePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: AppRoutes.gameMainPage,
      page: () => GameMain(),
      binding: HomeBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: AppRoutes.lastMovePage,
      page: () => GameMain(),
      binding: HomeBinding(),
    ),
  ];
}
