abstract class ReAssignPurchasingTeamStates {}

class ReAssignPurchasingTeamInitState extends ReAssignPurchasingTeamStates {}

class ReAssignPurchasingTeamLoadingState extends ReAssignPurchasingTeamStates {}

class ReAssignPurchasingTeamSuccessState extends ReAssignPurchasingTeamStates {}

class ReAssignPurchasingTeamErrorState extends ReAssignPurchasingTeamStates {
  final String error;

  ReAssignPurchasingTeamErrorState(this.error);
}

class ReAssignPurchaserMemberLoadingState extends ReAssignPurchasingTeamStates {}

class ReAssignPurchaserMemberSuccessState extends ReAssignPurchasingTeamStates {}

class ReAssignPurchaserMemberErrorState extends ReAssignPurchasingTeamStates {
  final String error;

  ReAssignPurchaserMemberErrorState(this.error);
}
