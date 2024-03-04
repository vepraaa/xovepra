import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xovepra/app/routes/app_pages.dart';
import 'package:xovepra/models/session/session.dart';
import 'package:xovepra/models/short_session/short_session.dart';
import 'package:xovepra/models/player/player.dart';
import 'package:xovepra/services/network_service.dart';
import 'package:xovepra/services/storage_service.dart';

class MainController extends GetxController {
  StorageService storageService = StorageService();
  NetworkServices networkServices = NetworkServices();
  Rx<SessionResponse> currentSession = SessionResponse().obs;
  RxList<ShortSession> shortSession = <ShortSession>[].obs;
  final newPlayerNicknameController = TextEditingController();
  final sessionnameController = TextEditingController();
  Rx<PlayerResponse> currentPlayer = PlayerResponse(player: Player()).obs;

  @override
  void onInit(){
    updateLocalData();
    getSessions();
    super.onInit();
  }

  Future<void> updateLocalData() async {
    currentPlayer.value = await storageService.readPlayerResponse('player');
    currentSession.value = await storageService.readSessionResponse('session');
    await getSessions();
  }

  Future<void> createSession(String sessionName) async {
    if (await networkServices.createSession(sessionName)) {
      updateLocalData();
      Get.back();
    } else {
      Get.snackbar("Ошибка", "Не удалось создать сессию",
          backgroundColor: Colors.red);
    }
  }

  Future<void> startSession(String sessionId) async {
    if (await networkServices.startSession(sessionId)) {
      updateLocalData();
      Get.offAndToNamed(Routes.GAME);
    } else {
      Get.snackbar("Ошибка", "Не удалось запустить игру",
          backgroundColor: Colors.red);
    }
  }

  Future<void> getSessions() async {
    shortSession.assignAll(await networkServices.getSessions() ?? []);
    if (shortSession.isEmpty) {
      Get.snackbar("Ошибка", "Не получилось получить сессии",
          backgroundColor: Colors.red);
    }
  }

  Future<void> getSessionById(String sessionId) async {
    var data = await networkServices.getSessionById(sessionId);
    if (data != null) {
      currentSession.value = data;
    } else {
      Get.snackbar(
          "Ошибка", "Не получилось получить данные о конкретной сессии",
          backgroundColor: Colors.red);
    }
  }

  Future<void> joinSession(String sessionId) async {
    if (await networkServices.joinSession(sessionId)) {
      updateLocalData();
      Get.offAndToNamed(Routes.GAME);
    } else {
      Get.snackbar("Ошибка", "Не удалось подключиться",
          backgroundColor: Colors.red);
    }
  }

  Future<void> logout() async {
    if (await networkServices.deletePlayer()) {
      await storageService.delete("player");
      await storageService.delete("baseAuth");
      Get.offAllNamed(Routes.LOGIN);
    } else {
      Get.snackbar("Ошибка", "Не удается сменить пользователя",
          backgroundColor: Colors.red);
    }
  }

  Future<void> changeNickname(newNickname) async {
    if (await networkServices.changeNickname(newNickname)) {
      updateLocalData();
      return Get.back();
    } else {
      Get.snackbar("Ошибка", "Не удалось сменить никнейм",
          backgroundColor: Colors.red);
    }
  }
}