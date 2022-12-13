abstract class IssuedOrdersStates {}

class IssuedOrdersInitState extends IssuedOrdersStates {}

class IssuedOrdersLoadingState extends IssuedOrdersStates {}

class IssuedOrdersSuccessState extends IssuedOrdersStates {}

class IssuedOrdersErrorState extends IssuedOrdersStates {
  final String error;

  IssuedOrdersErrorState(this.error);
}

class IssuedOrdersSearchLoadingState extends IssuedOrdersStates {}

class IssuedOrdersSearchSuccessState extends IssuedOrdersStates {}

class IssuedOrdersSearchErrorState extends IssuedOrdersStates {
  final String error;

  IssuedOrdersSearchErrorState(this.error);
}

class IssuedOrdersDeleteLoadingState extends IssuedOrdersStates {}

class IssuedOrdersDeleteSuccessState extends IssuedOrdersStates {}

class IssuedOrdersDeleteErrorState extends IssuedOrdersStates {
  final String error;

  IssuedOrdersDeleteErrorState(this.error);
}