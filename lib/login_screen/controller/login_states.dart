abstract class LoginStates {}

class LoginInitState extends LoginStates {}

class LogiLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

class ChangeVisibilityPasswordState extends LoginStates {}

class GetCurrentLocationState extends LoginStates {}

class GetLongitudeAndLatitudeState extends LoginStates {}
