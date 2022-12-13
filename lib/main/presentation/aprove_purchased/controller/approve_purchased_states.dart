abstract class ApprovePurchasedStates {}

class ApprovePurchasedInitStates extends ApprovePurchasedStates {}

class ChangeContract extends ApprovePurchasedStates {}

class ApprovePurchasedLoadingStates extends ApprovePurchasedStates {}

class ApprovePurchasedSuccessStates extends ApprovePurchasedStates {}

class ApprovePurchasedErrorStates extends ApprovePurchasedStates {
  final String error;

  ApprovePurchasedErrorStates(this.error);
}

class GetCurrentLocationState extends ApprovePurchasedStates {}

class GetLongitudeAndLatitudeState extends ApprovePurchasedStates {}

class GetCityLoadingState extends ApprovePurchasedStates {}

class GetCitySuccessState extends ApprovePurchasedStates {}

class GetCityErrorState extends ApprovePurchasedStates {
  final String error;

  GetCityErrorState(this.error);
}

class GetAreaLoadingState extends ApprovePurchasedStates {}

class GetAreaSuccessState extends ApprovePurchasedStates {}

class GetAreaErrorState extends ApprovePurchasedStates {
  final String error;

  GetAreaErrorState(this.error);
}
