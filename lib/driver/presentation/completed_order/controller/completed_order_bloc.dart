import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import 'package:zetico/app/services/dio_helper/dio_helper.dart';

import '../../../model/collected_order_model.dart';
import 'completed_order_states.dart';

class CompletedOrderBloc extends Cubit<CompletedOrderStates> {
  CompletedOrderBloc() : super(CompletedOrderInitState());
  static CompletedOrderBloc get(context) => BlocProvider.of(context);
  CompletedOrderModel completedorderModel = CompletedOrderModel();
  void getCompletedOrder({
    required String driverId,
  }) {
    emit(CompletedOrderLoadingState());
    DioHelper.postData(path: ApiConstant.completedorderPath, data: {
      "driverId": driverId,
    }).then((value) {
      completedorderModel = CompletedOrderModel.fromJson(value.data);
      emit(CompletedOrderSuccessState());
    }).catchError((error) {
      emit(CompletedOrderErrorState(error.toString()));
    });
  }
}
