abstract class ApprovePurchasingStates {}

class ApprovePurchasingInitStates extends ApprovePurchasingStates {}

class ChangeContract extends ApprovePurchasingStates {}

class ApprovePurchasingLoadingStates extends ApprovePurchasingStates {}

class ApprovePurchasingSuccessStates extends ApprovePurchasingStates {}

class ApprovePurchasingErrorStates extends ApprovePurchasingStates {
  final String error;

  ApprovePurchasingErrorStates(this.error);
}

class ApprovePurchasedLoadingStates extends ApprovePurchasingStates {}

class ApprovePurchasedSuccessStates extends ApprovePurchasingStates {}

class ApprovePurchasedErrorStates extends ApprovePurchasingStates {
  final String error;

  ApprovePurchasedErrorStates(this.error);
}
