import 'package:basic_flutter/models/userState.dart';

class AuthState {
  final bool isAuthenticated;
  final bool isAuthenticating;
  final User user;
  final String error;

  AuthState({
    this.isAuthenticated,
    this.isAuthenticating,
    this.user,
    this.error,
  });

  AuthState copyWith(
      {bool isAuthenticated, bool isAuthenticating, User user, String error}) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isAuthenticating: isAuthenticating ?? this.isAuthenticating,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }

  AuthState.initialState()
      : isAuthenticated = false,
        isAuthenticating = false,
        user = User.initialState(),
        error = null;

  factory AuthState.fromJSON(Map<String, dynamic> json) => AuthState(
        isAuthenticated: json['isAuthenticated'],
        isAuthenticating: json['isAuthenticating'],
        error: json['error'],
        user: json['user'] == null ? null : new User.fromJSON(json['user']),
      );

  Map<String, dynamic> toJSON() => <String, dynamic>{
        'isAuthenticated': this.isAuthenticated,
        'isAuthenticating': this.isAuthenticating,
        'user': this.user == null ? null : this.user.toJSON(),
        'error': this.error,
      };

  @override
  String toString() {
    return '''{
                isAuthenticated: $isAuthenticated,
                isAuthenticating: $isAuthenticating,
                user: $user,
                error: $error
            }''';
  }
}
