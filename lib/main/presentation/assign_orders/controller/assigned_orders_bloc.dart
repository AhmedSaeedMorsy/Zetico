import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import '../../../../app/services/dio_helper/dio_helper.dart';
import '../../../models/assigned_order_model.dart';
import 'assigned_orders_states.dart';

class AssignedOrdersBloc extends Cubit<AssignedOrdersStates> {
  AssignedOrdersBloc() : super(AssignedOrdersInitState());

  static AssignedOrdersBloc get(context) => BlocProvider.of(context);

  AssignedOrdersModel assignedOrdersModel = AssignedOrdersModel();
  void getAssignedOrders() {
    emit(AssignedOrdersLoadingState());
    DioHelper.getData(
      path: ApiConstant.getAssignedOrdersPath,
    ).then((value) {
      assignedOrdersModel = AssignedOrdersModel.fromjson(value.data);
      emit(AssignedOrdersSuccessState());
    }).catchError((error) {
      emit(AssignedOrdersErrorState(error.toString()));
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
  void deleteAssignedOrder({
    required String orderId,
  }) {
    emit(AssignedOrdersDeleteLoadingState());
    DioHelper.postData(path: ApiConstant.deleteAssignedOrderPath, data: {
      "orderId": orderId,
    }).then((value) {
      emit(AssignedOrdersDeleteSuccessState());
    }).catchError((error) {
      emit(AssignedOrdersDeleteErrorState(error.toString()));
    });
  }
}
