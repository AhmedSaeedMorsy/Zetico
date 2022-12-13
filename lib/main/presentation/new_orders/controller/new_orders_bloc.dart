import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import 'package:zetico/main/models/new_orders_model.dart';
import '../../../../app/services/dio_helper/dio_helper.dart';
import 'new_orders_states.dart';

class NewOrdersBloc extends Cubit<NewOrdersStates> {
  NewOrdersBloc() : super(NewOrdersInitState());

  static NewOrdersBloc get(context) => BlocProvider.of(context);

  NewOrdersModel newOrdersModel = NewOrdersModel();
  void getNewOrders() {
    emit(NewOrdersLoadingState());
    DioHelper.getData(
      path: ApiConstant.getNewOrdersPath,
    ).then((value) {
      newOrdersModel = NewOrdersModel.fromjson(value.data);
      emit(NewOrdersSuccessState());
    }).catchError((error) {
      emit(NewOrdersErrorState(error.toString()));
    });
  }

  // NewOrdersModel newOrderSearch = NewOrdersModel();
  // void searchNewOPath(String name) {
  //   emit(NewOrdersSearchLoadingState());
  //   DioHelper.getData(
  //     path: ApiConstant.searchNewOPathPath(name),
  //   ).then((value) {
  //     newOrdersModel = NewOrdersModel.fromjson(value.data);
  //     newOrdersModel.orders = newOrdersModel.orders;
  //     emit(NewOrdersSearchSuccessState());
  //   }).catchError((error) {
  //     emit(NewOrdersSearchErrorState(error.toString()));
  //   });
  // }
  void deleteNewOrder({
    required String orderId,
  }) {
    emit(NewOrdersDeleteLoadingState());
    DioHelper.postData(path: ApiConstant.deleteNewOrderPath, data: {
      "orderId": orderId,
    }).then((value) {
      emit(NewOrdersDeleteSuccessState());
    }).catchError((error) {
      emit(NewOrdersDeleteErrorState(error.toString()));
    });
  }
}
