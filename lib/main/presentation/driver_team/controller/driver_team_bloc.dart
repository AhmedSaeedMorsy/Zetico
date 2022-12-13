import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import '../../../../app/services/dio_helper/dio_helper.dart';
import '../../../models/driver_team_model.dart';
import 'driver_team_states.dart';

class DriverTeamBloc extends Cubit<DriverTeamStates> {
  DriverTeamBloc() : super(DriverTeamInitState());

  static DriverTeamBloc get(context) => BlocProvider.of(context);

  DriverTeamModel driverTeamModel = DriverTeamModel();
  void getDriverTeam() {
    emit(DriverTeamInitState());
    DioHelper.getData(
      path: ApiConstant.getDriverTeamPath,
    ).then((value) {
      driverTeamModel = DriverTeamModel.fromjson(value.data);
      emit(DriverTeamSuccessState());
    }).catchError((error) {
      emit(DriverTeamErrorState(error.toString()));
    });
  }

  void assignDriverMember({
    required String orderId,
    required String driverId,
    required String userId,
  }) {
    emit(AssignDriverMemberLoadingState());
    DioHelper.postData(path: ApiConstant.assignDriverPath, data: {
      "orderId": orderId,
      "driverId": driverId,
      "userId": userId,
    }).then((value) {
      emit(AssignDriverMemberSuccessState());
    }).catchError((error) {
      emit(AssignDriverMemberErrorState(error.toString()));
    });
  }
}
