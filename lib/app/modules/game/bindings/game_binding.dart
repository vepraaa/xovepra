import 'package:get/get.dart';

import '../controllers/game_controller.dart';

class GameBinding extends Bindings {
  @override
  @override
  void dependencies() {
    Get.put<GameController>(GameController());
  }
}