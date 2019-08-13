import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:basic_flutter/models/userState.dart';
import 'package:basic_flutter/models/appState.dart';
import 'package:basic_flutter/utils/api.dart';

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
  return (Store<AppState> store) async {
    try {
      store.dispatch(UserLoginRequest());
      final jsonData = await fetch('login');
      User userDetails =
          User.fromJSON(jsonData); // convert from json to User object
      if (username == 'qadir' && password == 'qadirhusainee') {
        store.dispatch(UserLoginSuccess(userDetails));
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        store
            .dispatch(UserLoginFailure('Username or password were incorrect.'));
      }
    } catch (error) {
      store.dispatch(UserLoginFailure('Error occurred while fetching api'));
    }
  };
};

final Function logout = (BuildContext context) {
  return (Store<AppState> store) {
    store.dispatch(UserLogout());
    Navigator.of(context).pushReplacementNamed('/login');
  };
};
