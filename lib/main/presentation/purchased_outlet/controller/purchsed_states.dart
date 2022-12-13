abstract class PurchsedStates {}

class PurchsedInitState extends PurchsedStates {}

class PurchsedLoadingState extends PurchsedStates {}

class PurchsedSuccessState extends PurchsedStates {}

class PurchsedErrorState extends PurchsedStates {
  final String error;

  PurchsedErrorState(this.error);
}

class PurchsedSearchLoadingState extends PurchsedStates {}

class PurchsedSearchSuccessState extends PurchsedStates {}

class PurchsedSearchErrorState extends PurchsedStates {
  final String error;

  PurchsedSearchErrorState(this.error);
}
class PurchsedDeclinedLoadingState extends PurchsedStates {}

class PurchsedDeclinedSuccessState extends PurchsedStates {}

class PurchsedDeclinedErrorState extends PurchsedStates {
  final String error;

  PurchsedDeclinedErrorState(this.error);
}
class PurchsedNotAgreedLoadingState extends PurchsedStates {}

class PurchsedNotAgreedSuccessState extends PurchsedStates {}

class PurchsedNotAgreedErrorState extends PurchsedStates {
  final String error;

  PurchsedNotAgreedErrorState(this.error);
}

