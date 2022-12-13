abstract class EditNewOrderStates {}

class EditNewOrderInitState extends EditNewOrderStates {}

class EditNewOrderLoadingState extends EditNewOrderStates {}

class EditNewOrderSuccessState extends EditNewOrderStates {}

class EditNewOrderErrorState extends EditNewOrderStates {
  final String error;
  EditNewOrderErrorState(this.error);
}

class ChangeNumberPickerState extends EditNewOrderStates {}

class OutletPriceLoadingState extends EditNewOrderStates {}

class OutletPriceSuccessState extends EditNewOrderStates {}

class OutletPriceErrorState extends EditNewOrderStates {
  final String error;

  OutletPriceErrorState(this.error);
}

class ChangeStringSelectDate extends EditNewOrderStates {}

class ChangeBackgroungColorButton extends EditNewOrderStates {}

class EditOrderLoadingState extends EditNewOrderStates {}

class EditOrderSuccessState extends EditNewOrderStates {}

class EditOrderErrorState extends EditNewOrderStates {
  final String error;

  EditOrderErrorState(this.error);
}
