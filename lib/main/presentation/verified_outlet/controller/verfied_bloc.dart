import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import 'package:zetico/main/presentation/verified_outlet/controller/verfied_states.dart';
import '../../../../app/services/dio_helper/dio_helper.dart';
import '../../../models/verfied_model.dart';

class VerfiedBloc extends Cubit<VerfiedStates> {
  VerfiedBloc() : super(VerfiedInitState());

  static VerfiedBloc get(context) => BlocProvider.of(context);

  VerfiedOutletModel verfiedModel = VerfiedOutletModel();
  void getVerfied() {
    emit(VerfiedLoadingState());
    DioHelper.getData(
      path: ApiConstant.verifiedOutletPath,
    ).then((value) {
      verfiedModel = VerfiedOutletModel.fromjson(value.data);
      emit(VerfiedSuccessState());
    }).catchError((error) {
      emit(VerfiedErrorState(error.toString()));
    });
  }

  VerfiedOutletModel verfiedSearch = VerfiedOutletModel();
  void searchVerfied(String name) {
    emit(VerfiedSearchLoadingState());
    DioHelper.getData(
      path: ApiConstant.searchVerifiedPath(name),
    ).then((value) {
      verfiedSearch = VerfiedOutletModel.fromjson(value.data);
      verfiedModel.resturant = verfiedSearch.resturant;
      emit(VerfiedSearchSuccessState());
    }).catchError((error) {
      emit(VerfiedSearchErrorState(error.toString()));
    });
  }

  void declinedVerifiedOutlet({
    required String outletId,
  }) {
    emit(VerfiedDeclinedLoadingState());
    DioHelper.postData(
      path: ApiConstant.declinedVerifiedPath,
      data: {
        "outletId": outletId,
      },
    ).then(
      (value) {
        emit(VerfiedDeclinedSuccessState());
      },
    ).catchError(
      (error) {
        emit(VerfiedDeclinedErrorState(error.toString()));
      },
    );
  }
}
