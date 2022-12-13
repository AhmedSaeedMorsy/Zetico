import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import '../../../../app/services/dio_helper/dio_helper.dart';
import '../../../models/survyed_outlet_model.dart';
import 'add_outlet_states.dart';

class AddOutletBloc extends Cubit<AddOutletStates> {
  AddOutletBloc() : super(AddOutletInitState());

  static AddOutletBloc get(context) => BlocProvider.of(context);
  SurveyedResturantOutletModel addOutletModel = SurveyedResturantOutletModel();

  void postOutlet({
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
  }) {
    emit(AddOutletLoadingState());
    DioHelper.postData(
      path: ApiConstant.addOutletPath,
      data: {
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
      },
    ).then(
      (value) {
        emit(AddOutletSuccessState());
      },
    ).catchError(
      (error) {
        emit(AddOutletErrorState(error.toString()));
      },
    );
  }
}
