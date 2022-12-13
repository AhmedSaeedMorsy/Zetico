abstract class CollectionOrderStates {}

class CollectionOrderInitState extends CollectionOrderStates {}

class CollectionOrderLoadingState extends CollectionOrderStates {}

class CollectionOrderSuccessState extends CollectionOrderStates {}

class CollectionOrderErrorState extends CollectionOrderStates {
  final String error;

  CollectionOrderErrorState(this.error);
}

class IssuedLoadingState extends CollectionOrderStates {}

class IssuedSuccessState extends CollectionOrderStates {}

class IssuedErrorState extends CollectionOrderStates {
  final String error;

  IssuedErrorState(this.error);
}

class PostIssuedLoadingState extends CollectionOrderStates {}

class PostIssuedSuccessState extends CollectionOrderStates {}

class PostIssuedErrorState extends CollectionOrderStates {
  final String error;

  PostIssuedErrorState(this.error);
}

class ChangeCheckBoxState extends CollectionOrderStates {}

class ChangeNumberPickerState extends CollectionOrderStates {}
class ChangePriceState extends CollectionOrderStates {}
