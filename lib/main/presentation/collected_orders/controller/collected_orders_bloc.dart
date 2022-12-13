import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import '../../../../app/services/dio_helper/dio_helper.dart';
import '../../../models/collected_orde_model.dart';
import 'collected_orders_states.dart';

class CollectedOrdersBloc extends Cubit<CollectedOrdersStates> {
  CollectedOrdersBloc() : super(CollectedOrdersInitState());

  static CollectedOrdersBloc get(context) => BlocProvider.of(context);

  CollectedOrdersModel collectedOrdersModel = CollectedOrdersModel();
  void getCollectedOrders() {
    emit(CollectedOrdersLoadingState());
    DioHelper.getData(
      path: ApiConstant.getCollectedOrdersPath,
    ).then((value) {
      collectedOrdersModel = CollectedOrdersModel.fromjson(value.data);
      emit(CollectedOrdersSuccessState());
    }).catchError((error) {
      emit(CollectedOrdersErrorState(error.toString()));
    });
  }
}
