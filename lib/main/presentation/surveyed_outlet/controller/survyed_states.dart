abstract class SurveyedStates {}

class SurvyedInitState extends SurveyedStates {}

class SurvyedSuccessState extends SurveyedStates {}

class SurvyedLoadingState extends SurveyedStates {}

class SurvyedErrorState extends SurveyedStates {
  final String error;

  SurvyedErrorState(this.error);
}

class SurvyedSearchSuccessState extends SurveyedStates {}

class SurvyedSearchLoadingState extends SurveyedStates {}

class SurvyedSearchErrorState extends SurveyedStates {
  final String error;

  SurvyedSearchErrorState(this.error);
}
class ApproveSurvyedSuccessState extends SurveyedStates {}

class ApproveSurvyedLoadingState extends SurveyedStates {}

class ApproveSurvyedErrorState extends SurveyedStates {
  final String error;

  ApproveSurvyedErrorState(this.error);
}

class DeclinedSurvyedSuccessState extends SurveyedStates {}

class DeclinedSurvyedLoadingState extends SurveyedStates {}

class DeclinedSurvyedErrorState extends SurveyedStates {
  final String error;

  DeclinedSurvyedErrorState(this.error);
}