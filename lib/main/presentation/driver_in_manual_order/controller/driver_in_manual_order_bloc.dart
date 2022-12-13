import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import '../../../../app/services/dio_helper/dio_helper.dart';
import '../../../models/driver_team_model.dart';
import 'driver_in_manual_order_states.dart';

class DriverTeamInManualOrderBloc extends Cubit<DriverTeamInManualOrderStates> {
  DriverTeamInManualOrderBloc() : super(DriverTeamInManualOrderInitState());

  static DriverTeamInManualOrderBloc get(context) => BlocProvider.of(context);

  DriverTeamModel driverTeamModel = DriverTeamModel();
  void getDriverTeam() {
    emit(DriverTeamInManualOrderLoadingState());
    DioHelper.getData(
      path: ApiConstant.getDriverTeamPath,
    ).then((value) {
      driverTeamModel = DriverTeamModel.fromjson(value.data);
      emit(DriverTeamInManualOrderSuccessState());
    }).catchError((error) {
      emit(DriverTeamInManualOrderErrorState(error.toString()));
    });
  }

  void assignDriverMember({
    required String outletId,
    required String orderQty,
    required String orderDate,
    required String driverId,
    required String userId,
  }) {
    emit(AssignDriverMemberLoadingState());
    DioHelper.postData(path: ApiConstant.confirmAssignDriverPath, data: {
      "outletId": outletId,
      "orderQty": orderQty,
      "orderDate": orderDate,
      "driverId": driverId,
      "userId": userId,
    }).then((value) {
      emit(AssignDriverMemberSuccessState());
    }).catchError((error) {
      emit(AssignDriverMemberErrorState(error.toString()));
    });
  }
}
