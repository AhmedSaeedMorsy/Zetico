abstract class OnProgressOrderStates {}

class OnProgressOrderInitState extends OnProgressOrderStates {}

class OnProgressOrderLoadingState extends OnProgressOrderStates {}

class OnProgressOrderSuccessState extends OnProgressOrderStates {}

class OnProgressOrderErrorState extends OnProgressOrderStates {
  final String error;

  OnProgressOrderErrorState(this.error);
}
