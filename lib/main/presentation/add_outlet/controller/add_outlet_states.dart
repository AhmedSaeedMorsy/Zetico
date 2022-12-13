abstract class AddOutletStates {}

class AddOutletInitState extends AddOutletStates {}

class AddOutletSuccessState extends AddOutletStates {}

class AddOutletLoadingState extends AddOutletStates {}

class AddOutletErrorState extends AddOutletStates {
  final String error;
  AddOutletErrorState(this.error);
}

class GetCurrentLocationState extends AddOutletStates {}

class GetLongitudeAndLatitudeState extends AddOutletStates {}

class GetCityLoadingState extends AddOutletStates {}

class GetCitySuccessState extends AddOutletStates {}

class GetCityErrorState extends AddOutletStates {
  final String error;

  GetCityErrorState(this.error);
}

class GetAreaLoadingState extends AddOutletStates {}

class GetAreaSuccessState extends AddOutletStates {}

class GetAreaErrorState extends AddOutletStates {
  final String error;

  GetAreaErrorState(this.error);
}
