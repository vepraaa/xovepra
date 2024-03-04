import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  MainView({super.key});

  final MainController sessionController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: sessionController.shortSession.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        title: Text(
                          "Сессия ${index + 1}: ${sessionController.shortSession[index].name}",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 61, 0, 204),
                          ),
                        ),
                        subtitle: Text(
                          "Хост: ${sessionController.shortSession[index].host_name}",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 61, 0, 204),
                          ),
                        ),
                        onTap: () async {
                          await sessionController.getSessionById(
                              sessionController.shortSession[index].id);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Информация о сессии"),
                                actions: [
                                  Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Имя сессии: ${sessionController.currentSession.value.name}",
                                        ),
                                        Text(
                                            "Никнейм гостя: ${sessionController.currentSession.value.guest_name ?? "никого нет"}"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Obx(() {
                                          if (sessionController.currentSession
                                                  .value.host_name ==
                                              sessionController.currentPlayer
                                                  .value.player.username) {
                                            return ElevatedButton(
                                              onPressed: () {
                                                if (sessionController
                                                        .currentSession
                                                        .value
                                                        .guest_name !=
                                                    null) {
                                                  sessionController
                                                      .startSession(
                                                          sessionController
                                                              .currentSession
                                                              .value
                                                              .id);
                                                } else {
                                                  Get.snackbar("Ошибка",
                                                      "Нет второго игрока");
                                                }
                                              },
                                              child: Text("Запустить игру"),
                                            );
                                          } else {
                                            return ElevatedButton(
                                              onPressed: () {
                                                if (sessionController
                                                            .currentSession
                                                            .value
                                                            .guest_name ==
                                                        null ||
                                                    sessionController
                                                            .currentSession
                                                            .value
                                                            .guest_name ==
                                                        sessionController
                                                            .currentPlayer
                                                            .value
                                                            .player
                                                            .username) {
                                                  sessionController.joinSession(
                                                      sessionController
                                                          .currentSession
                                                          .value
                                                          .id);
                                                } else {
                                                  Get.snackbar(
                                                      "Ошибка", "Лобби занято");
                                                }
                                              },
                                              child: Text("Подключиться"),
                                            );
                                          }
                                        }),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () => sessionController.logout(),
                child: Text("Сменить пользователя"),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Создать сессию"),
                      content: TextFormField(
                        controller: sessionController.sessionnameController,
                        decoration:
                            InputDecoration(labelText: "Название сессии"),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("Отмена"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            sessionController.createSession(
                                sessionController.sessionnameController.text);
                          },
                          child: Text("Создать"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Создать сессию"),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Сменить никнейм"),
                            content: TextFormField(
                              controller:
                                  sessionController.newPlayerNicknameController,
                              decoration:
                                  InputDecoration(labelText: "Новый никнейм"),
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text("Отмена"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  sessionController.changeNickname(
                                      sessionController
                                          .newPlayerNicknameController.text);
                                },
                                child: Text("Сохранить"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("Сменить никнейм"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Obx(() => Text(
                          "Никнейм: ${sessionController.currentPlayer.value.player.username}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
