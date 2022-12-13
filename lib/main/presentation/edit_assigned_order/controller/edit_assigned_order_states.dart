abstract class EditAssignedOrderStates {}

class EditAssignedOrderInitState extends EditAssignedOrderStates {}

class EditAssignedOrderLoadingState extends EditAssignedOrderStates {}

class EditAssignedOrderSuccessState extends EditAssignedOrderStates {}

class EditAssignedOrderErrorState extends EditAssignedOrderStates {
  final String error;
  EditAssignedOrderErrorState(this.error);
}

class ChangeNumberPickerState extends EditAssignedOrderStates {}

class OutletPriceLoadingState extends EditAssignedOrderStates {}

class OutletPriceSuccessState extends EditAssignedOrderStates {}

class OutletPriceErrorState extends EditAssignedOrderStates {
  final String error;

  OutletPriceErrorState(this.error);
}

class ChangeStringSelectDate extends EditAssignedOrderStates {}

class ChangeBackgroungColorButton extends EditAssignedOrderStates {}

class EditOrderLoadingState extends EditAssignedOrderStates {}

class EditOrderSuccessState extends EditAssignedOrderStates {}

class EditOrderErrorState extends EditAssignedOrderStates {
  final String error;

  EditOrderErrorState(this.error);
}
