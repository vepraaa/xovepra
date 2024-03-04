import 'dart:convert';

import 'package:xovepra/models/player/player.dart';
import 'package:xovepra/services/storage_service.dart';

StorageService storageService = StorageService();

void getBaseAuth(PlayerResponse user) {
  String baseAuth =
      'Basic ${base64.encode(utf8.encode('${user.player.username}:${user.private_key}'))}';
  storageService.writeBaseAuth("baseAuth", baseAuth);
} 