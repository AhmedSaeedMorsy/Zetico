abstract class OnProgressOrdersStates {}

class OnProgressOrdersInitState extends OnProgressOrdersStates {}

class OnProgressOrdersLoadingState extends OnProgressOrdersStates {}

class OnProgressOrdersSuccessState extends OnProgressOrdersStates {}

class OnProgressOrdersErrorState extends OnProgressOrdersStates {
  final String error;

  OnProgressOrdersErrorState(this.error);
}

class OnProgressOrdersSearchLoadingState extends OnProgressOrdersStates {}

class OnProgressOrdersSearchSuccessState extends OnProgressOrdersStates {}

class OnProgressOrdersSearchErrorState extends OnProgressOrdersStates {
  final String error;

  OnProgressOrdersSearchErrorState(this.error);
}

class OnProgressOrdersDeleteLoadingState extends OnProgressOrdersStates {}

class OnProgressOrdersDeleteSuccessState extends OnProgressOrdersStates {}

class OnProgressOrdersDeleteErrorState extends OnProgressOrdersStates {
  final String error;

  OnProgressOrdersDeleteErrorState(this.error);
}