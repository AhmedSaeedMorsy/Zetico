abstract class CompletedOrderStates {}

class CompletedOrderInitState extends CompletedOrderStates {}

class CompletedOrderLoadingState extends CompletedOrderStates {}

class CompletedOrderSuccessState extends CompletedOrderStates {}

class CompletedOrderErrorState extends CompletedOrderStates {
  final String error;

  CompletedOrderErrorState(this.error);
}
