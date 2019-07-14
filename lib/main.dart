import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:redux/redux.dart';

import 'package:basic_flutter/models/appState.dart';
import 'package:basic_flutter/containers/login.dart';
import 'package:basic_flutter/reducers/appReducer.dart';
import 'package:basic_flutter/containers/home.dart';
import 'package:basic_flutter/middleware/middleware.dart';

void main() async {
  final persistor = Persistor<AppState>(
    storage: FlutterStorage(),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
  );
  final initialState = await persistor.load();
  print(initialState.toJson());
  final Store<AppState> store = Store(
    appReducer,
    initialState: initialState ?? AppState.initialState(),
    middleware: createMiddleware(),
  );

  runApp(BuiltReduxApp(store: store));
}

class BuiltReduxApp extends StatelessWidget {
  final Store<AppState> store;

  const BuiltReduxApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          title: 'Redux Product App',
          theme: ThemeData(
              primarySwatch: Colors.teal,
              buttonColor: Colors.redAccent,
              accentColor: Colors.redAccent,
              buttonTheme: ButtonThemeData(
                  buttonColor: Colors.redAccent,
                  textTheme: ButtonTextTheme.primary)),
          routes: {
            '/': (BuildContext context) =>
                new StoreConnector<AppState, dynamic>(
                    converter: (store) => store.state.authState.isAuthenticated,
                    builder: (BuildContext context, isAuthenticated) =>
                        isAuthenticated == false
                            ? new LoginPage(title: "login")
                            : new HomePage()),
            '/home': (context) => HomePage(),
            '/login': (context) => LoginPage(title: "login")
          },
        ));
  }
}
