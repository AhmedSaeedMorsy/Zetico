abstract class ManualOrderStates {}

class ManualOrderInitState extends ManualOrderStates {}

class ManualOrderLoadingState extends ManualOrderStates {}

class ManualOrderSuccessState extends ManualOrderStates {}

class ManualOrderErrorState extends ManualOrderStates {
  final String error;
  ManualOrderErrorState(this.error);
}

class ChangeNumberPickerState extends ManualOrderStates {}

class OutletPriceLoadingState extends ManualOrderStates {}

class OutletPriceSuccessState extends ManualOrderStates {}

class OutletPriceErrorState extends ManualOrderStates {
  final String error;

  OutletPriceErrorState(this.error);
}

class ChangeStringSelectDate extends ManualOrderStates {}

class ChangeBackgroungColorButton extends ManualOrderStates {}

class AddOrderLoadingState extends ManualOrderStates {}

class AddOrderSuccessState extends ManualOrderStates {}

class AddOrderErrorState extends ManualOrderStates {
  final String error;

  AddOrderErrorState(this.error);
}
