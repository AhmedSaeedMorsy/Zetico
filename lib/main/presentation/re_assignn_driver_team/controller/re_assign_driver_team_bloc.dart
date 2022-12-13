import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import '../../../../app/services/dio_helper/dio_helper.dart';
import '../../../models/driver_team_model.dart';
import 're_assign_driver_team_states.dart';

class ReAssignDriverTeamBloc extends Cubit<ReAssignDriverTeamStates> {
  ReAssignDriverTeamBloc() : super(ReAssignDriverTeamInitState());

  static ReAssignDriverTeamBloc get(context) => BlocProvider.of(context);

  DriverTeamModel driverTeamModel = DriverTeamModel();
  void getDriverTeam({
    required String orderId,
  }) {
    emit(ReAssignDriverTeamInitState());
    DioHelper.getData(
      path: ApiConstant.getReAssignDriverTeamPath(
        orderId,
      ),
    ).then((value) {
      driverTeamModel = DriverTeamModel.fromjson(value.data);
      emit(ReAssignDriverTeamSuccessState());
    }).catchError((error) {
      emit(ReAssignDriverTeamErrorState(error.toString()));
    });
  }

  void reAssignDriverMember({
    required String orderId,
    required String driverId,
    required String userId,
  }) {
    emit(ReAssignDriverMemberLoadingState());
    DioHelper.postData(path: ApiConstant.reAssignDriverPath, data: {
      "orderId": orderId,
      "driverId": driverId,
      "userId": userId,
    }).then((value) {
      emit(ReAssignDriverMemberSuccessState());
    }).catchError((error) {
      emit(ReAssignDriverMemberErrorState(error.toString()));
    });
  }
}
