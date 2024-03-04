import 'package:freezed_annotation/freezed_annotation.dart';

abstract class Constants{
  static const baseUrl = 'http://195.54.32.97:8383/api/users/';
  static const defaultPadding  = 16.0;
}

abstract class ApiEndpoints {
  static const registration = 'register';
  static const login = 'login';
  static const refresh = 'refresh';
}

const String baseUrl = 'https://ttt.bulbaman.me';


enum GameState {
  @JsonValue("NotStarted")
  NotStarted,
  
  @JsonValue("Ongoing")
  Ongoing,
  
  @JsonValue("XWon")
  XWon,
  
  @JsonValue("OWon")
  OWon,
  
  @JsonValue("Draw")
  Draw
}
enum XOState {
  x,
  o,
  e,
}