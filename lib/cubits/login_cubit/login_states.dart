abstract class LoginState {}

class InitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailureState extends LoginState {
  String errorMessage;
  LoginFailureState(this.errorMessage);
}
