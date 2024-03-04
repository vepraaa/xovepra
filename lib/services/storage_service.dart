import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:xovepra/models/session/session.dart';
import 'package:xovepra/models/player/player.dart';

class StorageService extends GetxService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  Future<PlayerResponse> readPlayerResponse(String key) async {
    String? data = await storage.read(key: key);
    if (data != null) {
      return PlayerResponse.fromJson(jsonDecode(data));
    } else {
      return PlayerResponse(player: Player());
    }
  }

  Future<void> writePlayerResponse(String key, PlayerResponse player) async {
    await storage.write(key: key, value: jsonEncode(player.toJson()));
  }

  Future<void> writeSessionResponse(String key, SessionResponse session) async {
    await storage.write(key: key, value: jsonEncode(session.toJson()));
  }

  Future<SessionResponse> readSessionResponse(String key) async {
    String? data = await storage.read(key: key);
    if (data!=null){
      return SessionResponse.fromJson(jsonDecode(data));
    }
    else {
      return SessionResponse();
    }
  }

  Future<void> writeBaseAuth(String key, String baseAuth) async {
    await storage.write(key: key, value: baseAuth);
  }

  Future<void> delete(String key) async {
    await storage.delete(key: key);
  }
}