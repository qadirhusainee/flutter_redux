import 'package:basic_flutter/models/appState.dart';
import 'package:basic_flutter/reducers/productsReducer.dart';
import 'package:basic_flutter/reducers/authReducer.dart';

AppState appReducer(AppState state, dynamic action) =>
    AppState(authState: authReducer(state.authState, action));
// products: productsReducer(state.products, action));
