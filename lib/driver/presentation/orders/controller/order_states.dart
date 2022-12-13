abstract class OrderStates {}

class OrderInitState extends OrderStates {}

class OrderLoadingState extends OrderStates {}

class OrderSuccessState extends OrderStates {}

class OrderErrorState extends OrderStates {
  final String error;

  OrderErrorState(this.error);
}

class OrderToProgressLoadingState extends OrderStates {}

class OrderToProgressSuccessState extends OrderStates {}

class OrderToProgressErrorState extends OrderStates {
  final String error;

  OrderToProgressErrorState(this.error);
}

