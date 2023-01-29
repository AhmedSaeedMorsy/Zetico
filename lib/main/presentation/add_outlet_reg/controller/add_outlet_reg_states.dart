abstract class AddOutletRegStates {}

class AddOutletInitState extends AddOutletRegStates {}

class ViewOutletSuccessState extends AddOutletRegStates {}

class ViewOutletLoadingState extends AddOutletRegStates {}

class ViewOutletErrorState extends AddOutletRegStates {
  final String error;
  ViewOutletErrorState(this.error);
}

class GetCurrentLocationState extends AddOutletRegStates {}

class GetLongitudeAndLatitudeState extends AddOutletRegStates {}

class GetCityLoadingState extends AddOutletRegStates {}

class GetCitySuccessState extends AddOutletRegStates {}

class GetCityErrorState extends AddOutletRegStates {
  final String error;

  GetCityErrorState(this.error);
}

class GetAreaLoadingState extends AddOutletRegStates {}

class GetAreaSuccessState extends AddOutletRegStates {}

class GetAreaErrorState extends AddOutletRegStates {
  final String error;

  GetAreaErrorState(this.error);
}
