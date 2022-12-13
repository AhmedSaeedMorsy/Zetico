import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import '../../../../app/services/dio_helper/dio_helper.dart';
import '../../../models/issued_order_model.dart';
import 'issued_orders_states.dart';

class IssuedOrdersBloc extends Cubit<IssuedOrdersStates> {
  IssuedOrdersBloc() : super(IssuedOrdersInitState());

  static IssuedOrdersBloc get(context) => BlocProvider.of(context);

  IssuedOrdersModel issuedOrdersModel = IssuedOrdersModel();
  void getIssuedOrders() {
    emit(IssuedOrdersLoadingState());
    DioHelper.getData(
      path: ApiConstant.getIssuedOrdersPath,
    ).then((value) {
      issuedOrdersModel = IssuedOrdersModel.fromjson(value.data);
      emit(IssuedOrdersSuccessState());
    }).catchError((error) {
      emit(IssuedOrdersErrorState(error.toString()));
    });
  }
}
