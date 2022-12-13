import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import '../../../../app/services/dio_helper/dio_helper.dart';
import 'edit_Purchasing_states.dart';

class EditPurchasingBloc extends Cubit<EditPurchasingStates> {
  EditPurchasingBloc() : super(EditPurchasingInitState());

  static EditPurchasingBloc get(context) => BlocProvider.of(context);

  void editPurchasing({
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
    emit(EditPurchasingLoadingState());
    DioHelper.postData(path: ApiConstant.editPurchasingPath, data: {
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
    }).then((value) {
      emit(EditPurchasingSuccessState());
    }).catchError((error) {
      emit(EditPurchasingErrorState(error.toString()));
    });
  }
}
