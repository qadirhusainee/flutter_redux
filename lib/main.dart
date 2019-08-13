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
              primarySwatch: MatrialPrimaryColor,
              buttonColor: Color.fromRGBO(233, 116, 28, 1),
              accentColor: MatrialSecondaryColor,
              buttonTheme: ButtonThemeData(
                  buttonColor: MatrialSecondaryColor,
                  textTheme: ButtonTextTheme.primary)),
          routes: {
            '/': (BuildContext context) =>
                new StoreConnector<AppState, dynamic>(
                    converter: (store) => store.state.authState.isAuthenticated,
                    builder: (BuildContext context, isAuthenticated) =>
                        isAuthenticated == false
                            ? new LoginPage(title: "Login")
                            : new HomePage()),
            '/home': (context) => HomePage(),
            '/login': (context) => LoginPage(title: "Login")
          },
        ));
  }
}

const MaterialColor MatrialPrimaryColor =
    const MaterialColor(0xFFE9741C, const <int, Color>{
  50: Color.fromRGBO(233, 116, 28, .05),
  100: Color.fromRGBO(233, 116, 28, .1),
  200: Color.fromRGBO(233, 116, 28, .2),
  300: Color.fromRGBO(233, 116, 28, .3),
  400: Color.fromRGBO(233, 116, 28, .4),
  500: Color.fromRGBO(233, 116, 28, .5),
  600: Color.fromRGBO(233, 116, 28, .6),
  700: Color.fromRGBO(233, 116, 28, .7),
  800: Color.fromRGBO(233, 116, 28, .8),
  900: Color.fromRGBO(233, 116, 28, .9)
});

const MaterialColor MatrialSecondaryColor =
    const MaterialColor(0xFF002F6C, const <int, Color>{
  50: Color.fromRGBO(0, 47, 108, .05),
  100: Color.fromRGBO(0, 47, 108, .1),
  200: Color.fromRGBO(0, 47, 108, .2),
  300: Color.fromRGBO(0, 47, 108, .3),
  400: Color.fromRGBO(0, 47, 108, .4),
  500: Color.fromRGBO(0, 47, 108, .5),
  600: Color.fromRGBO(0, 47, 108, .6),
  700: Color.fromRGBO(0, 47, 108, .7),
  800: Color.fromRGBO(0, 47, 108, .8),
  900: Color.fromRGBO(0, 47, 108, .9)
});
