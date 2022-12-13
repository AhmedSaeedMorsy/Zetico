import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';

import '../../../../app/services/dio_helper/dio_helper.dart';
import '../../../models/verfied_model.dart';
import 'purchasing_states.dart';

class PurchasingBloc extends Cubit<PurchasingStates> {
  PurchasingBloc() : super(PurchsingInitState());

  static PurchasingBloc get(context) => BlocProvider.of(context);

  VerfiedOutletModel purchsingModel = VerfiedOutletModel();
  void getPurchsing() {
    emit(PurchsingLoadingState());
    DioHelper.getData(
      path: ApiConstant.getPurchsingPath,
    ).then((value) {
      purchsingModel = VerfiedOutletModel.fromjson(value.data);
      emit(PurchsingSuccessState());
    }).catchError((error) {
      emit(PurchsingErrorState(error.toString()));
    });
  }

  VerfiedOutletModel purchesingSearch = VerfiedOutletModel();
  void searchPurchesing(String name) {
    emit(PurchsingSearchLoadingState());
    DioHelper.getData(
      path: ApiConstant.searchPurchesingPath(name),
    ).then((value) {
      purchsingModel = VerfiedOutletModel.fromjson(value.data);
      purchsingModel.resturant = purchsingModel.resturant;
      emit(PurchsingSearchSuccessState());
    }).catchError((error) {
      emit(PurchsingSearchErrorState(error.toString()));
    });
  }

  void declinedPurchasing({required String outletId}) {
    emit(DeclinedPurchasingLoadingState());
    DioHelper.postData(
      path: ApiConstant.declinedPurchasingPath,
      data: {
        "outletId": outletId,
      },
    ).then((value) {
      emit(DeclinedPurchasingSuccessState());
    }).catchError((error) {
      emit(DeclinedPurchasingErrorState(error.toString()));
    });
  }
}
