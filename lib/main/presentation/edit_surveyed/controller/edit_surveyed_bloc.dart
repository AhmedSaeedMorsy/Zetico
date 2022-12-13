import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import 'package:zetico/app/resources/strings_manager.dart';

import '../../../../app/services/dio_helper/dio_helper.dart';
import 'edit_surveyed_states.dart';

class EditSurvyedBloc extends Cubit<EditSurvyedStates> {
  EditSurvyedBloc() : super(EditSurvyedInitState());

  static EditSurvyedBloc get(context) => BlocProvider.of(context);
  List<String> paymentMethodList = [
    AppStrings.cashOnDelivery.tr(),
    AppStrings.postPoned.tr(),
  ];
  void editSurvyed({
    required String outletNameEn,
    required String outletNameAr,
    required String cityEn,
    required String areaEn,
    required String custName,
    required String phone,
    required String addressDetail,
    required String location,
    required String sureyedBy,
    required String userType,
    required String priceKg,
    required String payment,
    required String oilType,
    required String quantity,
    required String outletSpace,
    required String notes,
    required String id,
  }) {
    emit(EditSurvyedLoadingState());
    DioHelper.postData(path: ApiConstant.editSurveyedPath, data: {
      "outletNameEn": outletNameEn,
      "outletNameAr": outletNameAr,
      "cityEn": cityEn,
      "areaEn": areaEn,
      "custName": custName,
      "phone": phone,
      "addressDetail": addressDetail,
      "location": location,
      "surveyedBy": sureyedBy,
      "userType": userType,
      "priceKg": priceKg,
      "payment": payment,
      "oilType": oilType,
      "quantity": quantity,
      "outletSpace": outletSpace,
      "notes": notes,
      "outletId": id,
    }).then((value) {
      emit(EditSurvyedSuccessState());
    }).catchError((error) {
      emit(EditSurvyedErrorState(error.toString()));
    });
  }
}
