import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:basic_flutter/models/appState.dart';
import 'package:basic_flutter/actions/authActions.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, dynamic>(
        converter: (store) => (BuildContext context) {
              store.dispatch(logout(context));
            },
        builder: (BuildContext context, logout) => Drawer(
              child: ListView(
                children: <Widget>[
                  Container(),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text("Profile"),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Setting"),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text("Sign Out"),
                  ),
                ],
              ),
            ));
  }
}
