abstract class MainStates {}

class MainInitState extends MainStates {}

class MainLoadingState extends MainStates {}

class MainSuccessState extends MainStates {}

class MainErrorState extends MainStates {
  final String error;

  MainErrorState(this.error);
}

class GetCurrentLocationState extends MainStates {}

class GetLongitudeAndLatitudeState extends MainStates {}

class GetCityLoadingState extends MainStates {}

class GetCitySuccessState extends MainStates {}

class GetCityErrorState extends MainStates {
  final String error;

  GetCityErrorState(this.error);
}

class GetAreaLoadingState extends MainStates {}

class GetAreaSuccessState extends MainStates {}

class GetAreaErrorState extends MainStates {
  final String error;

  GetAreaErrorState(this.error);
}
