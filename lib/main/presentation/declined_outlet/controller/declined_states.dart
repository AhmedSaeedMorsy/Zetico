abstract class DeclinedStates {}

class DeclinedInitState extends DeclinedStates {}

class DeclinedLoadingState extends DeclinedStates {}

class DeclinedSuccessState extends DeclinedStates {}

class DeclinedErrorState extends DeclinedStates {
  final String error;

  DeclinedErrorState(this.error);
}
