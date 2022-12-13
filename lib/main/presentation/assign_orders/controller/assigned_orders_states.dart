abstract class AssignedOrdersStates {}

class AssignedOrdersInitState extends AssignedOrdersStates {}

class AssignedOrdersLoadingState extends AssignedOrdersStates {}

class AssignedOrdersSuccessState extends AssignedOrdersStates {}

class AssignedOrdersErrorState extends AssignedOrdersStates {
  final String error;

  AssignedOrdersErrorState(this.error);
}

class AssignedOrdersSearchLoadingState extends AssignedOrdersStates {}

class AssignedOrdersSearchSuccessState extends AssignedOrdersStates {}

class AssignedOrdersSearchErrorState extends AssignedOrdersStates {
  final String error;

  AssignedOrdersSearchErrorState(this.error);
}

class AssignedOrdersDeleteLoadingState extends AssignedOrdersStates {}

class AssignedOrdersDeleteSuccessState extends AssignedOrdersStates {}

class AssignedOrdersDeleteErrorState extends AssignedOrdersStates {
  final String error;

  AssignedOrdersDeleteErrorState(this.error);
}