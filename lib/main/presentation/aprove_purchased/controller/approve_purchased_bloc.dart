import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import '../../../../app/services/dio_helper/dio_helper.dart';
import 'approve_purchased_states.dart';

class ApprovePurchasedBloc extends Cubit<ApprovePurchasedStates> {
  ApprovePurchasedBloc() : super(ApprovePurchasedInitStates());

  static ApprovePurchasedBloc get(context) => BlocProvider.of(context);
  bool contract = false;

  void changeContract() {
    contract = !contract;
    emit(ChangeContract());
  }
  void approvePurchased({
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
    required String date,
    required String id,
    required String custPhone,
    required String custRole,
    required String workerName,
    required String workerPhone,
    required String workerRole,
    required String agreementName,
    required String agreementDate,
    required String contract,
    required String endDate,
    required String startDate,
    required String approvedBy,
    required String notes,
    required String approveName,
    required String approveDate,
  }) {
    emit(ApprovePurchasedLoadingStates());
    DioHelper.postData(path: ApiConstant.approvePurchasedPath, data: {
      "outletId": id,
      "outletNameEn": outletNameEn,
      "outletNameAr": outletNameAr,
      "cityEn": cityEn,
      "areaEn": areaEn,
      "custName": custName,
      "phone": phone,
      "addressDetail": addressDetail,
      "location": location,
      "approvedBy": approvedBy,
      "userType": userType,
      "date": date,
      "priceKg": priceKg,
      "payment": payment,
      "oilType": oilType,
      "quantity": quantity,
      "outletSpace": outletSpace,
      "notes": notes,
      "custPhone": custPhone,
      "custRole": custRole,
      "workerName": workerName,
      "workerPhone": workerPhone,
      "workerRole": workerRole,
      "agreementName": agreementName,
      "agreementDate": agreementDate,
      "startDate": startDate,
      "endDate": endDate,
      "Contract": contract,
      "approveName": approveName,
      "approveDate": approveDate,
    }).then((value) {
      emit(ApprovePurchasedSuccessStates());
    }).catchError((error) {
      emit(ApprovePurchasedErrorStates(error.toString()));
    });
  }
}
