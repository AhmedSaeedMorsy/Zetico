abstract class EditSurvyedStates {}

class EditSurvyedInitState extends EditSurvyedStates {}

class EditSurvyedLoadingState extends EditSurvyedStates {}

class EditSurvyedSuccessState extends EditSurvyedStates {}

class EditSurvyedErrorState extends EditSurvyedStates {
  final String error;

  EditSurvyedErrorState(this.error);
}