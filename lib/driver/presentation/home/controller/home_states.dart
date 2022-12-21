abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class CheckInLoadingState extends HomeStates {}

class CheckInSuccessState extends HomeStates {}

class CheckInErrorState extends HomeStates {
  final String error;

  CheckInErrorState(this.error);
}

class CheckOutLoadingState extends HomeStates {}

class CheckOutSuccessState extends HomeStates {}

class CheckOutErrorState extends HomeStates {
  final String error;

  CheckOutErrorState(this.error);
}