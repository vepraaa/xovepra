import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xovepra/app/routes/app_pages.dart';
import 'package:xovepra/services/network_service.dart';

class LoginController extends GetxController {
  NetworkServices networkServices = NetworkServices();
  final usernameController = TextEditingController();

  void login() async {
    if (await networkServices.addPlayer(usernameController.text)) {
      Get.offAndToNamed(Routes.MAIN);
    } else {
      Get.snackbar("Ошибка", "Не удалось войти", backgroundColor: Colors.red);
    }
  }
}
