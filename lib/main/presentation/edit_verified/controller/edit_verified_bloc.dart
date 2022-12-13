import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import '../../../../app/services/dio_helper/dio_helper.dart';
import 'edit_verified_states.dart';

class EditVerifiedBloc extends Cubit<EditVerifiedStates> {
  EditVerifiedBloc() : super(EditVerifiedInitState());

  static EditVerifiedBloc get(context) => BlocProvider.of(context);

  void editVerified({
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
    emit(EditVerifiedLoadingState());
    DioHelper.postData(
      path: ApiConstant.editVerifiedPath,
      data: {
        "outletNameEn": outletNameEn,
        "outletNameAr": outletNameAr,
        "cityEn": cityEn,
        "areaEn": areaEn,
        "custName": custName,
        "phone": phone,
        "addressDetail": addressDetail,
        "location": location,
        "priceKg": priceKg,
        "payment": payment,
        "oilType": oilType,
        "quantity": quantity,
        "outletSpace": outletSpace,
        "notes": notes,
        "outletId": id,
      },
    ).then(
      (value) {
        emit(EditVerifiedSuccessState());
      },
    ).catchError(
      (error) {
        emit(EditVerifiedErrorState(error.toString()));
      },
    );
  }
}
