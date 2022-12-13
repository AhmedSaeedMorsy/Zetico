abstract class DriverTeamInManualOrderStates {}

class DriverTeamInManualOrderInitState extends DriverTeamInManualOrderStates {}

class DriverTeamInManualOrderLoadingState extends DriverTeamInManualOrderStates {}

class DriverTeamInManualOrderSuccessState extends DriverTeamInManualOrderStates {}

class DriverTeamInManualOrderErrorState extends DriverTeamInManualOrderStates {
  final String error;

  DriverTeamInManualOrderErrorState(this.error);
}

class AssignDriverMemberLoadingState extends DriverTeamInManualOrderStates {}

class AssignDriverMemberSuccessState extends DriverTeamInManualOrderStates {}

class AssignDriverMemberErrorState extends DriverTeamInManualOrderStates {
  final String error;

  AssignDriverMemberErrorState(this.error);
}
