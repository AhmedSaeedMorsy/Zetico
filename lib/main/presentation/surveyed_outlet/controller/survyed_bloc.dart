import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import 'package:zetico/app/resources/strings_manager.dart';
import 'package:zetico/main/presentation/surveyed_outlet/controller/survyed_states.dart';
import '../../../../app/services/dio_helper/dio_helper.dart';
import '../../../models/survyed_outlet_model.dart';

class SurveyedBloc extends Cubit<SurveyedStates> {
  SurveyedBloc() : super(SurvyedInitState());

  static SurveyedBloc get(context) => BlocProvider.of(context);

  SurveyedOutletModel survyedModel = SurveyedOutletModel();
  void getSurvyed() {
    emit(SurvyedLoadingState());
    DioHelper.getData(
      path: ApiConstant.surveyrdOutletPath,
    ).then((value) {
      survyedModel = SurveyedOutletModel.fromjson(value.data);
      emit(SurvyedSuccessState());
    }).catchError((error) {
      emit(SurvyedErrorState(error.toString()));
    });
  }

  SurveyedOutletModel survyedSearch = SurveyedOutletModel();
  void searchSurvyed(String name) {
    emit(SurvyedSearchLoadingState());
    DioHelper.getData(
      path: ApiConstant.searchSurveyedPath(name),
    ).then((value) {
      survyedSearch = SurveyedOutletModel.fromjson(value.data);
      survyedModel.resturant = survyedSearch.resturant;
      emit(SurvyedSearchSuccessState());
    }).catchError((error) {
      emit(SurvyedSearchErrorState(error.toString()));
    });
  }

  void approveSurvyed({required String outletId}) {
    emit(ApproveSurvyedLoadingState());
    DioHelper.postData(
        path: ApiConstant.approveSurveyedPath,
        data: {AppStrings.outletId: outletId}).then((value) {
      emit(ApproveSurvyedSuccessState());
    }).catchError((error) {
      emit(ApproveSurvyedErrorState(error.toString()));
    });
  }

  void declinedSurveyed({required String outletId}) {
    emit(DeclinedSurvyedLoadingState());
    DioHelper.postData(
      path: ApiConstant.declinedSurveyedPath,
      data: {
        AppStrings.outletId: outletId,
      },
    ).then(
      (value) {
        emit(DeclinedSurvyedSuccessState());
      },
    ).catchError((error) {
      emit(
        DeclinedSurvyedErrorState(
          error.toString(),
        ),
      );
    });
  }
}
