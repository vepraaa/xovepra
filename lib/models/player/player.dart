import 'package:freezed_annotation/freezed_annotation.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
class PlayerResponse with _$PlayerResponse {
  factory PlayerResponse({
    @Default("") String private_key,
    required Player player,
  }) = _PlayerResponse;

  factory PlayerResponse.fromJson(Map<String, dynamic> json) =>
      _$PlayerResponseFromJson(json);
  factory PlayerResponse.withUser(Player newPlayer) => PlayerResponse(player: newPlayer);
}

@freezed
class Player with _$Player {
  factory Player({
    @Default(null) String? in_session,
    @Default('') String username,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}