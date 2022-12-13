abstract class ViewOutletStates {}

class ViewOutletInitState extends ViewOutletStates {}

class ViewOutletLoadingState extends ViewOutletStates {}

class ViewOutletSuccessState extends ViewOutletStates {}

class ViewOutletErrorState extends ViewOutletStates {
  final String error;

  ViewOutletErrorState(this.error);
}

class ViewOutletSearchLoadingState extends ViewOutletStates {}

class ViewOutletSearchSuccessState extends ViewOutletStates {}

class ViewOutletSearchErrorState extends ViewOutletStates {
  final String error;

  ViewOutletSearchErrorState(this.error);
}

class AgreedSearchLoadingState extends ViewOutletStates {}

class AgreedSearchSuccessState extends ViewOutletStates {}

class AgreedSearchErrorState extends ViewOutletStates {
  final String error;

  AgreedSearchErrorState(this.error);
}

class ActiveSearchLoadingState extends ViewOutletStates {}

class ActiveSearchSuccessState extends ViewOutletStates {}

class ActiveSearchErrorState extends ViewOutletStates {
  final String error;

  ActiveSearchErrorState(this.error);
}

class InActiveSearchLoadingState extends ViewOutletStates {}

class InActiveSearchSuccessState extends ViewOutletStates {}

class InActiveSearchErrorState extends ViewOutletStates {
  final String error;

  InActiveSearchErrorState(this.error);
}
class NotAgreedSearchLoadingState extends ViewOutletStates {}

class NotAgreedSearchSuccessState extends ViewOutletStates {}

class NotAgreedSearchErrorState extends ViewOutletStates {
  final String error;

  NotAgreedSearchErrorState(this.error);
}
