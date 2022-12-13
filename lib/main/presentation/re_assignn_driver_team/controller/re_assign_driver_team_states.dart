abstract class ReAssignDriverTeamStates {}

class ReAssignDriverTeamInitState extends ReAssignDriverTeamStates {}

class ReAssignDriverTeamLoadingState extends ReAssignDriverTeamStates {}

class ReAssignDriverTeamSuccessState extends ReAssignDriverTeamStates {}

class ReAssignDriverTeamErrorState extends ReAssignDriverTeamStates {
  final String error;

  ReAssignDriverTeamErrorState(this.error);
}

class ReAssignDriverMemberLoadingState extends ReAssignDriverTeamStates {}

class ReAssignDriverMemberSuccessState extends ReAssignDriverTeamStates {}

class ReAssignDriverMemberErrorState extends ReAssignDriverTeamStates {
  final String error;

  ReAssignDriverMemberErrorState(this.error);
}
