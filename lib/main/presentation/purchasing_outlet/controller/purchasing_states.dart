abstract class PurchasingStates {}

class PurchsingInitState extends PurchasingStates {}

class PurchsingLoadingState extends PurchasingStates {}

class PurchsingSuccessState extends PurchasingStates {}

class PurchsingErrorState extends PurchasingStates {
  final String error;

  PurchsingErrorState(this.error);
}

class PurchsingSearchLoadingState extends PurchasingStates {}

class PurchsingSearchSuccessState extends PurchasingStates {}

class PurchsingSearchErrorState extends PurchasingStates {
  final String error;

  PurchsingSearchErrorState(this.error);
}

class DeclinedPurchasingLoadingState extends PurchasingStates {}

class DeclinedPurchasingSuccessState extends PurchasingStates {}

class DeclinedPurchasingErrorState extends PurchasingStates {
  final String error;

  DeclinedPurchasingErrorState(this.error);
}
