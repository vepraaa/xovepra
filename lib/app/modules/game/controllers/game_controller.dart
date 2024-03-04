import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xovepra/app/routes/app_pages.dart';
import 'package:xovepra/core/constants.dart';
import 'package:xovepra/models/session/session.dart';
import 'package:xovepra/models/player/player.dart';
import 'package:xovepra/services/network_service.dart';
import 'package:xovepra/services/storage_service.dart';

class GameController extends GetxController {
  StorageService get storageService => Get.find<StorageService>();
  NetworkServices get networkServices => Get.find<NetworkServices>();
  Rx<SessionResponse> currentSession = SessionResponse().obs;
  Rx<PlayerResponse> currentPlayer = PlayerResponse(player: Player()).obs;

  @override
  void onInit() async {
    updateLocalData();
    print(currentSession.value);
    super.onInit();
  }

  Future<void> updateLocalData() async {
    currentSession.value = await storageService.readSessionResponse('session');
    currentPlayer.value = await storageService.readPlayerResponse('player');
  }

  void onCellTapped(int index) {
    // Проверяем, что игра не завершена и ячейка пуста
    if (currentSession.value.gameState == GameState.Ongoing &&
        getCellValue(index) == "") {
      // Отправляем запрос на сервер о сделанном ходе
    }
  }

  // Метод для получения значения для отображения в ячейке
  String getCellValue(int index) {
    // Получаем значение из текущего состояния игры
    return currentSession.value.board?[index] ?? "";
  }

}