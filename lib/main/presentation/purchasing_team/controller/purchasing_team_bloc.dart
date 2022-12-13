import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import 'package:zetico/main/presentation/purchasing_team/controller/purchasing_team_states.dart';

import '../../../../app/services/dio_helper/dio_helper.dart';
import '../../../models/purchasing_team_model.dart';

class PurchasingTeamBloc extends Cubit<PurchasingTeamStates> {
  PurchasingTeamBloc() : super(PurchasingTeamInitState());

  static PurchasingTeamBloc get(context) => BlocProvider.of(context);

  PurchasingTeamModel purchasingTeamModel = PurchasingTeamModel();
  void getPurchasingTeam() {
    emit(PurchasingTeamInitState());
    DioHelper.getData(
      path: ApiConstant.purchasingTeamPath,
    ).then((value) {
      purchasingTeamModel = PurchasingTeamModel.fromjson(value.data);
      emit(PurchasingTeamSuccessState());
    }).catchError((error) {
      emit(PurchasingTeamErrorState(error.toString()));
    });
  }

  void assignPurchaserMember({
    required String outletId,
    required String teamMemberId,
  }) {
    emit(AssignPurchaserMemberLoadingState());
    DioHelper.postData(path: ApiConstant.assignPurchaserPath, data: {
      "outletId": outletId,
      "teamMemberId": teamMemberId,
    }).then((value) {
      emit(AssignPurchaserMemberSuccessState());
    }).catchError((error) {
      emit(AssignPurchaserMemberErrorState(error.toString()));
    });
  }
}
