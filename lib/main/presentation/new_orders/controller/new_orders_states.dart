abstract class NewOrdersStates {}

class NewOrdersInitState extends NewOrdersStates {}

class NewOrdersLoadingState extends NewOrdersStates {}

class NewOrdersSuccessState extends NewOrdersStates {}

class NewOrdersErrorState extends NewOrdersStates {
  final String error;

  NewOrdersErrorState(this.error);
}

class NewOrdersSearchLoadingState extends NewOrdersStates {}

class NewOrdersSearchSuccessState extends NewOrdersStates {}

class NewOrdersSearchErrorState extends NewOrdersStates {
  final String error;

  NewOrdersSearchErrorState(this.error);
}

class NewOrdersDeleteLoadingState extends NewOrdersStates {}

class NewOrdersDeleteSuccessState extends NewOrdersStates {}

class NewOrdersDeleteErrorState extends NewOrdersStates {
  final String error;

  NewOrdersDeleteErrorState(this.error);
}