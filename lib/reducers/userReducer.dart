import 'package:redux/redux.dart';
import 'package:basic_flutter/actions/userActions.dart';
import 'package:basic_flutter/models/userState.dart';

final userReducer = combineReducers<User>([
  new TypedReducer<User, SetUserAction>(_setUser),
  new TypedReducer<User, ClearUserAction>(_clearUserData),
]);

User _setUser(User user, SetUserAction action) {
  return action.user;
}

User _clearUserData(User user, ClearUserAction action) {
  return null;
}
