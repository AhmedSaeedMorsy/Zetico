abstract class EditVerifiedStates {}

class EditVerifiedInitState extends EditVerifiedStates {}

class EditVerifiedLoadingState extends EditVerifiedStates {}

class EditVerifiedSuccessState extends EditVerifiedStates {}

class EditVerifiedErrorState extends EditVerifiedStates {
  final String error;

  EditVerifiedErrorState(this.error);
}

class GetCurrentLocationState extends EditVerifiedStates {}

class GetLongitudeAndLatitudeState extends EditVerifiedStates {}

class GetCityLoadingState extends EditVerifiedStates {}

class GetCitySuccessState extends EditVerifiedStates {}

class GetCityErrorState extends EditVerifiedStates {
  final String error;

  GetCityErrorState(this.error);
}

class GetAreaLoadingState extends EditVerifiedStates {}

class GetAreaSuccessState extends EditVerifiedStates {}

class GetAreaErrorState extends EditVerifiedStates {
  final String error;

  GetAreaErrorState(this.error);
}
