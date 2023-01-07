import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mafia2/app/core/value/colors.dart';
import 'package:mafia2/app/data/service/storage/storage_service.dart';
import 'package:mafia2/app/localization/app_locaization.dart';
import 'package:mafia2/app/modules/binding/bindings.dart';

import 'package:mafia2/app/modules/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]).then((value) => );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: App.pages,
      translations: AppLocalization(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('fa', 'IR'),
      theme: ThemeData(
        backgroundColor: Colors.black,
        primaryColor: green,
        fontFamily: "Vazir",
      ),
      initialRoute: AppRoutes.splashScreen,
      initialBinding: HomeBinding(),
    );
  }
}
