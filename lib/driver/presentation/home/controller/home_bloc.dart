import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import 'package:zetico/app/services/dio_helper/dio_helper.dart';
import 'package:zetico/driver/presentation/home/controller/home_states.dart';

class HomeBloc extends Cubit<HomeStates> {
  HomeBloc() : super(HomeInitState());
  static HomeBloc get(context) => BlocProvider.of(context);
  bool isCheckIn = false;
  void checkIn({
    required String userId,
    required String memberLocation,
  }) {
    emit(CheckInLoadingState());
    DioHelper.postData(path: ApiConstant.checkInPath, data: {
      "userId": userId,
      "memberLocation": memberLocation,
    }).then((value) {
      isCheckIn = true;
      emit(CheckInSuccessState());
    }).catchError((error) {
      emit(
        CheckInErrorState(
          error.toString(),
        ),
      );
    });
  }

  void checkOut({
    required String userId,
    required String memberLocation,
  }) {
    emit(CheckOutLoadingState());
    DioHelper.postData(path: ApiConstant.checkOutPath, data: {
      "userId": userId,
      "memberLocation": memberLocation,
    }).then((value) {
      isCheckIn = false;
      emit(CheckOutSuccessState());
    }).catchError((error) {
      emit(
        CheckOutErrorState(
          error.toString(),
        ),
      );
    });
  }
}
