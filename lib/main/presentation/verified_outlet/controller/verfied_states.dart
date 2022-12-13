abstract class VerfiedStates {}

class VerfiedInitState extends VerfiedStates {}

class VerfiedSuccessState extends VerfiedStates {}

class VerfiedLoadingState extends VerfiedStates {}

class VerfiedErrorState extends VerfiedStates {
  final String error;

  VerfiedErrorState(this.error);
}

class VerfiedSearchSuccessState extends VerfiedStates {}

class VerfiedSearchLoadingState extends VerfiedStates {}

class VerfiedSearchErrorState extends VerfiedStates {
  final String error;

  VerfiedSearchErrorState(this.error);
}

class VerfiedDeclinedSuccessState extends VerfiedStates {}

class VerfiedDeclinedLoadingState extends VerfiedStates {}

class VerfiedDeclinedErrorState extends VerfiedStates {
  final String error;

  VerfiedDeclinedErrorState(this.error);
}