import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import '../../../../app/services/dio_helper/dio_helper.dart';
import '../../../models/on_progress_order_model.dart';
import 'on_progress_orders_states.dart';

class OnProgressOrdersBloc extends Cubit<OnProgressOrdersStates> {
  OnProgressOrdersBloc() : super(OnProgressOrdersInitState());

  static OnProgressOrdersBloc get(context) => BlocProvider.of(context);

  OnProgressOrdersModel onProgressOrdersModel = OnProgressOrdersModel();
  void getOnProgressOrders() {
    emit(OnProgressOrdersLoadingState());
    DioHelper.getData(
      path: ApiConstant.getOnProgressOrdersPath,
    ).then((value) {
      onProgressOrdersModel = OnProgressOrdersModel.fromJson(value.data);
      emit(OnProgressOrdersSuccessState());
    }).catchError((error) {
      emit(OnProgressOrdersErrorState(error.toString()));
    });
  }
}
