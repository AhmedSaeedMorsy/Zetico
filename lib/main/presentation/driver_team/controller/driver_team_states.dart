abstract class DriverTeamStates {}

class DriverTeamInitState extends DriverTeamStates {}

class DriverTeamLoadingState extends DriverTeamStates {}

class DriverTeamSuccessState extends DriverTeamStates {}

class DriverTeamErrorState extends DriverTeamStates {
  final String error;

  DriverTeamErrorState(this.error);
}

class AssignDriverMemberLoadingState extends DriverTeamStates {}

class AssignDriverMemberSuccessState extends DriverTeamStates {}

class AssignDriverMemberErrorState extends DriverTeamStates {
  final String error;

  AssignDriverMemberErrorState(this.error);
}
