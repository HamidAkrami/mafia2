import 'package:get/get.dart';
import 'package:mafia2/app/data/provider/provider.dart';
import 'package:mafia2/app/data/service/storage/repository.dart';
import 'package:mafia2/app/modules/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeController>(() => HomeController(
        mafiaRepository: MafiaRepository(mafiaProvider: MafiaProvider())));
  }
}
