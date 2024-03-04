// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerResponseImpl _$$PlayerResponseImplFromJson(Map<String, dynamic> json) =>
    _$PlayerResponseImpl(
      private_key: json['private_key'] as String? ?? "",
      player: Player.fromJson(json['player'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PlayerResponseImplToJson(
        _$PlayerResponseImpl instance) =>
    <String, dynamic>{
      'private_key': instance.private_key,
      'player': instance.player,
    };

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
      in_session: json['in_session'] as String? ?? null,
      username: json['username'] as String? ?? '',
    );

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) =>
    <String, dynamic>{
      'in_session': instance.in_session,
      'username': instance.username,
    };
