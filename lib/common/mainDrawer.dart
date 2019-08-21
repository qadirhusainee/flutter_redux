import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:basic_flutter/models/appState.dart';
import 'package:basic_flutter/actions/authActions.dart';

class MainDrawer extends StatelessWidget {
  final String currentRoute;
  MainDrawer(this.currentRoute);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, dynamic>(
        converter: (store) => (BuildContext context) {
              store.dispatch(logout(context));
            },
        builder: (BuildContext context, logout) => Drawer(
              child: ListView(
                children: <Widget>[
                  this.currentRoute != 'home'
                      ? ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed('/home');
                          },
                          leading: Icon(Icons.home),
                          title: Text("Home"),
                        )
                      : Container(),
                  this.currentRoute != 'profile'
                      ? ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed('/profile');
                          },
                          leading: Icon(Icons.info),
                          title: Text("Profile"),
                        )
                      : Container(),
                  this.currentRoute != 'setting'
                      ? ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed('/setting');
                          },
                          leading: Icon(Icons.settings),
                          title: Text("Setting"),
                        )
                      : Container(),
                  Divider(),
                  StoreConnector<AppState, _ViewModel>(
                    converter: (Store<AppState> store) =>
                        _ViewModel.create(store),
                    builder: (BuildContext context, _ViewModel viewModel) =>
                        ListTile(
                          onTap: () {
                            print('signout');
                            viewModel.onLogout(context);
                          },
                          leading: Icon(Icons.exit_to_app),
                          title: Text("Sign Out"),
                        ),
                  ),
                ],
              ),
            ));
  }
}

class _ViewModel {
  final Function(BuildContext context) onLogout;

  _ViewModel({this.onLogout});

  factory _ViewModel.create(Store<AppState> store) {
    _onLogout(BuildContext context) {
      return store.dispatch(logout(context));
    }

    return _ViewModel(onLogout: _onLogout);
  }
}
