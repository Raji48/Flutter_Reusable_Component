import 'package:flutter/cupertino.dart';

@immutable
class AppState {
  final LoginState login;

  AppState({
    required this.login,

  });
  factory AppState.initial() => AppState(
    login: LoginState.initial(),

  );

  AppState copyWith({
    required LoginState login,


  }) {
    return AppState(
      login:login ?? this.login,

    );
  }
}



class LoginState {
  bool loading;
  dynamic error;
  // Loginmodel success;


  LoginState({
    required this.loading,
    this.error,
    // this.success,

  });
  factory LoginState.initial() => LoginState(
    loading: false,
    error: null,
    //  success: null,


  );
}
