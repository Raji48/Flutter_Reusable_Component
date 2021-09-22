import 'package:wait4me/models/app_state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    login: loginReducer(state.login, action),

  );
}

loginReducer(LoginState login, action) {

}