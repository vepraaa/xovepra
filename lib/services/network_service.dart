import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:xovepra/core/constants.dart';
import 'package:xovepra/models/session/session.dart';
import 'package:xovepra/models/short_session/short_session.dart';
import 'package:xovepra/models/player/player.dart';
import 'package:xovepra/services/auth_service.dart';
import 'package:xovepra/services/storage_service.dart';

class NetworkServices extends GetxController {
  var httpClient = Dio();
  var storageService = StorageService();

  Future<bool> addPlayer(String nickname) async {
    try {
      var response = await httpClient.post('$baseUrl/player/add/$nickname');
      if (response.statusCode == 200) {
        var currentPlayer = PlayerResponse.fromJson(response.data);
        await storageService.writePlayerResponse("player", currentPlayer);
        getBaseAuth(currentPlayer);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deletePlayer() async {
    try {
      var response = await httpClient.delete('$baseUrl/Player/delete',
          data: await storageService.readPlayerResponse('Player'),
          options: Options(headers: <String, String>{
            'authorization': await storageService.read('baseAuth') ?? '',
          }));
      if (response.statusCode == 200) {
        return true;
      } else {
        print(response.statusCode);
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> createSession(String sessionName) async {
    try {
      var response =
          await httpClient.post('$baseUrl/session/create/$sessionName',
              options: Options(headers: <String, String>{
                'authorization': await storageService.read('baseAuth') ?? '',
              }));
      if (response.statusCode == 200) {
        var responseSession = SessionResponse.fromJson(response.data);
        await storageService.writeSessionResponse("session", responseSession);
        var data = await storageService.readPlayerResponse("player");
        var updatePlayerResponse = PlayerResponse(
            player: Player(
                in_session: responseSession.id, username: data.player.username));
        await storageService.writePlayerResponse("player", updatePlayerResponse);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<ShortSession>?> getSessions() async {
    try {
      var response = await httpClient.get('$baseUrl/session/get_all');
      if (response.statusCode == 200) {
        List<Map<String, dynamic>> sessionsData = List.castFrom(response.data);
        List<ShortSession> sessionsList =
            sessionsData.map((data) => ShortSession.fromJson(data)).toList();

        return sessionsList;
      } else {
        return null;
      }
    } catch (e) {
      print("Ошибка: $e");
      return null;
    }
  }

  Future<SessionResponse?> getSessionById(sessionId) async {
    try {
      var response = await httpClient.get('$baseUrl/session/get/$sessionId');
      if (response.statusCode == 200) {
        var currentSession = SessionResponse.fromJson(response.data);
        await storageService.writeSessionResponse("session", currentSession);
        return currentSession;
      } else {
        print(response.statusCode);
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> joinSession(String sessionId) async {
    var response = await httpClient.patch('$baseUrl/session/join/$sessionId',
        options: Options(headers: <String, String>{
          'authorization': await storageService.read('baseAuth') ?? '',
        }));
    if (response.statusCode == 200) {
      await storageService.writeSessionResponse(
          'session', SessionResponse.fromJson(response.data));
      var data = await storageService.readPlayerResponse("player");
      var updatePlayerResponse = PlayerResponse(
          player: Player(in_session: sessionId, username: data.player.username));
      await storageService.writePlayerResponse("player", updatePlayerResponse);
      return true;
    } else {
      print("Не удалось подключиться");
      return false;
    }
  }

  Future<bool> startSession(String sessionId) async {
    var response = await httpClient.patch('$baseUrl/session/start/$sessionId',
        options: Options(headers: <String, String>{
          'authorization': await storageService.read('baseAuth') ?? '',
        }));
    if (response.statusCode == 200) {
      await storageService.writeSessionResponse(
          'session', SessionResponse.fromJson(response.data));
      return true;
    } else {
      print("Не удалось запустить игру");
      return false;
    }
  }

  Future<bool> changeNickname(String newNickname) async {
    try {
      var response = await httpClient.patch('$baseUrl/player/update',
          data: {"playername": newNickname},
          options: Options(headers: <String, String>{
            'authorization': await storageService.read('baseAuth') ?? '',
          }));
      if (response.statusCode == 200) {
        var data = await storageService.readPlayerResponse('player');
        var updatePlayerResponse = PlayerResponse(
            private_key: data.private_key, player: Player.fromJson(response.data));
        await storageService.writePlayerResponse("player", updatePlayerResponse);
        return true;
      } else {
        print(response.statusCode);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}