import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import 'package:zetico/main/presentation/re_assign_purchasing_team/controller/re_assign_purchasing_team_states.dart';
import '../../../../app/services/dio_helper/dio_helper.dart';
import '../../../models/purchasing_team_model.dart';

class ReAssignPurchasingTeamBloc extends Cubit<ReAssignPurchasingTeamStates> {
  ReAssignPurchasingTeamBloc() : super(ReAssignPurchasingTeamInitState());

  static ReAssignPurchasingTeamBloc get(context) => BlocProvider.of(context);

  PurchasingTeamModel purchasingTeamModel = PurchasingTeamModel();
  void getReAssignPurchasingTeam({required outletId}) {
    emit(ReAssignPurchasingTeamInitState());
    DioHelper.getData(
      path: ApiConstant.getReAssignPurchasingTeamPath(outletId),
    ).then((value) {
      purchasingTeamModel = PurchasingTeamModel.fromjson(value.data);
      emit(ReAssignPurchasingTeamSuccessState());
    }).catchError((error) {
      emit(ReAssignPurchasingTeamErrorState(error.toString()));
    });
  }

  void rassignPurchaserMember({
    required String outletId,
    required String teamMemberId,
  }) {
    emit(ReAssignPurchaserMemberLoadingState());
    DioHelper.postData(path: ApiConstant.reAssignPurchasingTeam, data: {
      "outletId": outletId,
      "memberId": teamMemberId,
    }).then((value) {
      emit(ReAssignPurchaserMemberSuccessState());
    }).catchError((error) {
      emit(ReAssignPurchaserMemberErrorState(error.toString()));
    });
  }
}
