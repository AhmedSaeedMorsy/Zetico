abstract class EditPurchasingStates {}

class EditPurchasingInitState extends EditPurchasingStates {}

class EditPurchasingLoadingState extends EditPurchasingStates {}

class EditPurchasingSuccessState extends EditPurchasingStates {}

class EditPurchasingErrorState extends EditPurchasingStates {
  final String error;

  EditPurchasingErrorState(this.error);
}
