abstract class CollectedOrdersStates {}

class CollectedOrdersInitState extends CollectedOrdersStates {}

class CollectedOrdersLoadingState extends CollectedOrdersStates {}

class CollectedOrdersSuccessState extends CollectedOrdersStates {}

class CollectedOrdersErrorState extends CollectedOrdersStates {
  final String error;

  CollectedOrdersErrorState(this.error);
}

class CollectedOrdersSearchLoadingState extends CollectedOrdersStates {}

class CollectedOrdersSearchSuccessState extends CollectedOrdersStates {}

class CollectedOrdersSearchErrorState extends CollectedOrdersStates {
  final String error;

  CollectedOrdersSearchErrorState(this.error);
}

class CollectedOrdersDeleteLoadingState extends CollectedOrdersStates {}

class CollectedOrdersDeleteSuccessState extends CollectedOrdersStates {}

class CollectedOrdersDeleteErrorState extends CollectedOrdersStates {
  final String error;

  CollectedOrdersDeleteErrorState(this.error);
}