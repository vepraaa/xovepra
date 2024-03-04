import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xovepra/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            child: ElevatedButton(
                onPressed: () => Get.toNamed(Routes.LOGIN),
                child: Text('Войти')),
          )
        ],
      ),
    );
  }
}