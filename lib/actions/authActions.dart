import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:basic_flutter/models/userState.dart';
import 'package:basic_flutter/models/appState.dart';

class UserLoginRequest {}

class UserLoginSuccess {
  final User user;

  UserLoginSuccess(this.user);
}

class UserLoginFailure {
  final String error;

  UserLoginFailure(this.error);
}

class UserLogout {}

final Function login =
    (BuildContext context, String username, String password) {
  return (Store<AppState> store) {
    store.dispatch(UserLoginRequest());
    if (username == 'qadir' && password == 'qadirhusainee') {
      store.dispatch(
          UserLoginSuccess(User(id: "Random ID", token: "TokenBearer")));
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      store.dispatch(UserLoginFailure('Username or password were incorrect.'));
    }
  };
};

final Function logout = (BuildContext context) {
  return (Store<AppState> store) {
    store.dispatch(UserLogout());
    Navigator.of(context).pushReplacementNamed('/login');
  };
};
