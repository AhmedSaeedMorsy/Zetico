import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import '../../../../app/services/dio_helper/dio_helper.dart';
import '../../../models/purchsed_model.dart';
import 'purchsed_states.dart';

class PurchsedBloc extends Cubit<PurchsedStates> {
  PurchsedBloc() : super(PurchsedInitState());

  static PurchsedBloc get(context) => BlocProvider.of(context);

  PurchsedOutletModel purchsedModel = PurchsedOutletModel();
  void getPurchsed() {
    emit(PurchsedLoadingState());
    DioHelper.getData(
      path: ApiConstant.getPurchasedPath,
    ).then((value) {
      purchsedModel = PurchsedOutletModel.fromjson(value.data);
      emit(PurchsedSuccessState());
    }).catchError((error) {
      emit(PurchsedErrorState(error.toString()));
    });
  }

  PurchsedOutletModel purchesedSearch = PurchsedOutletModel();
  void searchPurchesed(String name) {
    emit(PurchsedSearchLoadingState());
    DioHelper.getData(
      path: ApiConstant.searchPurchasedPath(name),
    ).then((value) {
      purchesedSearch = PurchsedOutletModel.fromjson(value.data);
      purchsedModel.resturant = purchesedSearch.resturant;
      emit(PurchsedSearchSuccessState());
    }).catchError((error) {
      emit(PurchsedSearchErrorState(error.toString()));
    });
  }

  void notAgreedPurchased({
    required String outletId,
  }) {
    emit(PurchsedNotAgreedLoadingState());
    DioHelper.postData(path: ApiConstant.notAgreedPurchasedPath, data: {
      "outletId": outletId,
    }).then((value) {
      emit(PurchsedNotAgreedSuccessState());
    }).catchError((error) {
      emit(PurchsedNotAgreedErrorState(error.toString()));
    });
  }

  void declinedPurchased({
    required String outletId,
  }) {
    emit(PurchsedDeclinedLoadingState());
    DioHelper.postData(
        path: ApiConstant.declinedPurchasedPath,
        data: {"outletId": outletId}).then((value) {
      emit(PurchsedDeclinedSuccessState());
    }).catchError((error) {
      emit(PurchsedDeclinedErrorState(error.toString()));
    });
  }
}
