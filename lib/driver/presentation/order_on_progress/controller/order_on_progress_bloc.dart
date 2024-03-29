// ignore_for_file: deprecated_member_use

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zetico/app/constant/api_constant.dart';
import 'package:zetico/app/services/dio_helper/dio_helper.dart';
import 'package:zetico/driver/presentation/order_on_progress/controller/order_on_progress_states.dart';
import '../../../model/on_progress_order_model.dart';

class OnProgressOrderBloc extends Cubit<OnProgressOrderStates> {
  OnProgressOrderBloc() : super(OnProgressOrderInitState());
  static OnProgressOrderBloc get(context) => BlocProvider.of(context);
  OnProgressOrderModel onProgressOrderModel = OnProgressOrderModel();
  void getOnProgressOrder({
    required String driverId,
  }) {
    emit(OnProgressOrderLoadingState());
    DioHelper.postData(path: ApiConstant.onProgressOrderPath, data: {
      "driverId": driverId,
    }).then((value) {
      onProgressOrderModel = OnProgressOrderModel.fromJson(value.data);
      emit(OnProgressOrderSuccessState());
    }).catchError((error) {
      emit(OnProgressOrderErrorState(error.toString()));
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
