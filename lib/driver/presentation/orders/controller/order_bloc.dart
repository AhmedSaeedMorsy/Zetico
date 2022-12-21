// ignore_for_file: deprecated_member_use

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zetico/app/constant/api_constant.dart';
import 'package:zetico/app/services/dio_helper/dio_helper.dart';
import '../../../model/order_model.dart';
import '../../orders/controller/order_states.dart';

class OrderBloc extends Cubit<OrderStates> {
  OrderBloc() : super(OrderInitState());
  static OrderBloc get(context) => BlocProvider.of(context);
  OrderModel orderModel = OrderModel();
  void getOrder({
    required String driverId,
  }) {
    emit(OrderLoadingState());
    DioHelper.postData(path: ApiConstant.orderPath, data: {
      "driverId": driverId,
    }).then((value) {
      orderModel = OrderModel.fromJson(value.data);
      emit(OrderSuccessState());
    }).catchError((error) {
      emit(OrderErrorState(error.toString()));
    });
  }

  void postOrderToOnProgress({required String orderId}) {
    emit(OrderToProgressLoadingState());
    DioHelper.postData(path: ApiConstant.orderToOnProgressPath, data: {
      "orderId": orderId,
    }).then((value) {
      emit(OrderToProgressSuccessState());
    }).catchError((error) {
      emit(OrderToProgressErrorState(error.toString()));
    });
  }

  Future<void> openMap({
    required String location,
  }) async {
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=$location";
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    }
  }
}
