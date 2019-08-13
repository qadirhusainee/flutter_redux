import "./productState.dart";
import './userState.dart';
import 'package:flutter/material.dart';
import 'package:basic_flutter/models/authState.dart';

class AppState {
  AuthState authState;
  ProductState productState;

  AppState({
    @required this.authState,
    @required this.productState,
  });

  AppState copyWith({User user}) {
    return AppState(
        authState: authState ?? this.authState,
        productState: productState ?? this.productState);
  }

  AppState.initialState()
      : authState = AuthState.initialState(),
        productState = ProductState.initialState();

  static AppState fromJson(dynamic json) {
    AuthState initAuthState = json == null
        ? AuthState.initialState()
        : AuthState.fromJSON(json['authState']);
    ProductState initProductState = json == null
        ? ProductState.initialState()
        : ProductState.fromJSON(json['productState']);
    return AppState(authState: initAuthState, productState: initProductState);
  }

  Map<String, dynamic> toJson() =>
      {'authState': authState.toJSON(), 'productState': productState.toJson()};

  @override
  String toString() {
    return '''AppState{
            authState: $authState,
            productState: $productState
        }''';
  }
}
