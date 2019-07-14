import "./productState.dart";
import './userState.dart';
import 'package:flutter/material.dart';
import 'package:basic_flutter/models/authState.dart';

class AppState {
  AuthState authState;
  //Products products;

  AppState({
    @required this.authState,
    // @required this.products,
  });

  AppState copyWith({User user}) {
    return AppState(authState: authState ?? this.authState);
  }

  AppState.initialState() : authState = AuthState.initialState();

  static AppState fromJson(dynamic json) {
    AuthState initAuthState = json == null
        ? AuthState.initialState()
        : AuthState.fromJSON(json['authState']);
    return AppState(authState: initAuthState);
  }

  Map<String, dynamic> toJson() => {'authState': authState.toJSON()};

  @override
  String toString() {
    return '''AppState{
            authState: $authState,
        }''';
  }
}
