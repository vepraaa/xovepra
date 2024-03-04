// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlayerResponse _$PlayerResponseFromJson(Map<String, dynamic> json) {
  return _PlayerResponse.fromJson(json);
}

/// @nodoc
mixin _$PlayerResponse {
  String get private_key => throw _privateConstructorUsedError;
  Player get player => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerResponseCopyWith<PlayerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerResponseCopyWith<$Res> {
  factory $PlayerResponseCopyWith(
          PlayerResponse value, $Res Function(PlayerResponse) then) =
      _$PlayerResponseCopyWithImpl<$Res, PlayerResponse>;
  @useResult
  $Res call({String private_key, Player player});

  $PlayerCopyWith<$Res> get player;
}

/// @nodoc
class _$PlayerResponseCopyWithImpl<$Res, $Val extends PlayerResponse>
    implements $PlayerResponseCopyWith<$Res> {
  _$PlayerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? private_key = null,
    Object? player = null,
  }) {
    return _then(_value.copyWith(
      private_key: null == private_key
          ? _value.private_key
          : private_key // ignore: cast_nullable_to_non_nullable
              as String,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as Player,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayerCopyWith<$Res> get player {
    return $PlayerCopyWith<$Res>(_value.player, (value) {
      return _then(_value.copyWith(player: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlayerResponseImplCopyWith<$Res>
    implements $PlayerResponseCopyWith<$Res> {
  factory _$$PlayerResponseImplCopyWith(_$PlayerResponseImpl value,
          $Res Function(_$PlayerResponseImpl) then) =
      __$$PlayerResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String private_key, Player player});

  @override
  $PlayerCopyWith<$Res> get player;
}

/// @nodoc
class __$$PlayerResponseImplCopyWithImpl<$Res>
    extends _$PlayerResponseCopyWithImpl<$Res, _$PlayerResponseImpl>
    implements _$$PlayerResponseImplCopyWith<$Res> {
  __$$PlayerResponseImplCopyWithImpl(
      _$PlayerResponseImpl _value, $Res Function(_$PlayerResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? private_key = null,
    Object? player = null,
  }) {
    return _then(_$PlayerResponseImpl(
      private_key: null == private_key
          ? _value.private_key
          : private_key // ignore: cast_nullable_to_non_nullable
              as String,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as Player,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerResponseImpl implements _PlayerResponse {
  _$PlayerResponseImpl({this.private_key = "", required this.player});

  factory _$PlayerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerResponseImplFromJson(json);

  @override
  @JsonKey()
  final String private_key;
  @override
  final Player player;

  @override
  String toString() {
    return 'PlayerResponse(private_key: $private_key, player: $player)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerResponseImpl &&
            (identical(other.private_key, private_key) ||
                other.private_key == private_key) &&
            (identical(other.player, player) || other.player == player));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, private_key, player);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerResponseImplCopyWith<_$PlayerResponseImpl> get copyWith =>
      __$$PlayerResponseImplCopyWithImpl<_$PlayerResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerResponseImplToJson(
      this,
    );
  }
}

abstract class _PlayerResponse implements PlayerResponse {
  factory _PlayerResponse(
      {final String private_key,
      required final Player player}) = _$PlayerResponseImpl;

  factory _PlayerResponse.fromJson(Map<String, dynamic> json) =
      _$PlayerResponseImpl.fromJson;

  @override
  String get private_key;
  @override
  Player get player;
  @override
  @JsonKey(ignore: true)
  _$$PlayerResponseImplCopyWith<_$PlayerResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return _Player.fromJson(json);
}

/// @nodoc
mixin _$Player {
  String? get in_session => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerCopyWith<Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res, Player>;
  @useResult
  $Res call({String? in_session, String username});
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res, $Val extends Player>
    implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? in_session = freezed,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      in_session: freezed == in_session
          ? _value.in_session
          : in_session // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerImplCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$$PlayerImplCopyWith(
          _$PlayerImpl value, $Res Function(_$PlayerImpl) then) =
      __$$PlayerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? in_session, String username});
}

/// @nodoc
class __$$PlayerImplCopyWithImpl<$Res>
    extends _$PlayerCopyWithImpl<$Res, _$PlayerImpl>
    implements _$$PlayerImplCopyWith<$Res> {
  __$$PlayerImplCopyWithImpl(
      _$PlayerImpl _value, $Res Function(_$PlayerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? in_session = freezed,
    Object? username = null,
  }) {
    return _then(_$PlayerImpl(
      in_session: freezed == in_session
          ? _value.in_session
          : in_session // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerImpl implements _Player {
  _$PlayerImpl({this.in_session = null, this.username = ''});

  factory _$PlayerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerImplFromJson(json);

  @override
  @JsonKey()
  final String? in_session;
  @override
  @JsonKey()
  final String username;

  @override
  String toString() {
    return 'Player(in_session: $in_session, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerImpl &&
            (identical(other.in_session, in_session) ||
                other.in_session == in_session) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, in_session, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      __$$PlayerImplCopyWithImpl<_$PlayerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerImplToJson(
      this,
    );
  }
}

abstract class _Player implements Player {
  factory _Player({final String? in_session, final String username}) =
      _$PlayerImpl;

  factory _Player.fromJson(Map<String, dynamic> json) = _$PlayerImpl.fromJson;

  @override
  String? get in_session;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
