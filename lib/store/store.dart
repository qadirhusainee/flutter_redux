import 'package:redux/redux.dart';

import 'package:basic_flutter/reducers/appReducer.dart';
import 'package:basic_flutter/models/appState.dart';
import 'package:basic_flutter/middleware/middleware.dart';

Store<AppState> createStore() {
  Store<AppState> store = Store(
    appReducer,
    initialState: AppState.initialState(),
    middleware: createMiddleware(),
  );

  return store;
}
