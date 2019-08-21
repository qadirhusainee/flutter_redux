import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:basic_flutter/models/appState.dart';
import 'package:basic_flutter/actions/authActions.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  String _username = '';
  String _password = '';

  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: buildBody(width, height),
    );
  }

  Widget buildBody(double width, double height) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel viewModel) => Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    width: width * 0.7,
                    child: ScrollConfiguration(
                      behavior: ScrollBehavior(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(bottom: height * 0.1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Welcome,",
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    Text(
                                      "Sign in to continue",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                  ],
                                )),
                            Container(
                              margin: EdgeInsets.only(bottom: height * 0.05),
                              decoration: BoxDecoration(),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  children: <Widget>[
                                    buildTextUsername(),
                                    buildTextPassword(viewModel),
                                  ],
                                ),
                              ),
                            ),
                            RaisedButton(
                              onPressed: () {
                                onSubmit(viewModel, context);
                              },
                              child: Text("Login"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                viewModel.loading == true
                    ? Container(
                        decoration: BoxDecoration(color: Colors.black26),
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 5,
                          ),
                        ),
                      )
                    : Container()
              ],
            ));
  }

  void onSubmit(viewModel, context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      viewModel.setUser(_username, _password, context);
    } else {
      print("not valid");
    }
  }

  TextFormField buildTextPassword(viewModel) {
    return TextFormField(
      textInputAction: TextInputAction.go,
      focusNode: _passwordFocus,
      validator: (value) {
        return passwordValidator(value);
      },
      onFieldSubmitted: (term) {
        onSubmit(viewModel, context);
      },
      onSaved: (val) => _password = val,
      obscureText: true,
      decoration: InputDecoration(
          labelText: "Password",
          hasFloatingPlaceholder: true,
          errorText: null,
          fillColor: Colors.yellowAccent),
    );
  }

  String passwordValidator(String value) {
    if (value.isEmpty) {
      return 'Please enter password';
    } else if (value.length < 6) {
      return 'Password should contains atlease 6 letters';
    }
    return null;
  }

  TextFormField buildTextUsername() {
    return TextFormField(
      focusNode: _usernameFocus,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (term) {
        _usernameFocus.unfocus();
        FocusScope.of(context).requestFocus(_passwordFocus);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter username';
        }
        return null;
      },
      onSaved: (val) => _username = val,
      decoration: InputDecoration(
          labelText: "Username",
          errorText: null,
          fillColor: Colors.yellowAccent),
    );
  }
}

class _ViewModel {
  final Function(String, String, BuildContext) setUser;
  bool loading;
  _ViewModel({this.setUser, this.loading});

  factory _ViewModel.create(Store<AppState> store) {
    _onSetUser(username, password, BuildContext context) {
      return store.dispatch(login(context, username, password));
    }

    return _ViewModel(
        loading: store.state.authState.isAuthenticating, setUser: _onSetUser);
  }
}
