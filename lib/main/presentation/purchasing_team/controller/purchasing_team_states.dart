abstract class PurchasingTeamStates {}

class PurchasingTeamInitState extends PurchasingTeamStates {}

class PurchasingTeamLoadingState extends PurchasingTeamStates {}

class PurchasingTeamSuccessState extends PurchasingTeamStates {}

class PurchasingTeamErrorState extends PurchasingTeamStates {
  final String error;

  PurchasingTeamErrorState(this.error);
}

class AssignPurchaserMemberLoadingState extends PurchasingTeamStates {}

class AssignPurchaserMemberSuccessState extends PurchasingTeamStates {}

class AssignPurchaserMemberErrorState extends PurchasingTeamStates {
  final String error;

  AssignPurchaserMemberErrorState(this.error);
}
