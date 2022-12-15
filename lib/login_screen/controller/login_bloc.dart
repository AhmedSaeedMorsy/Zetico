import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import 'package:zetico/app/services/dio_helper/dio_helper.dart';
import 'package:zetico/login_screen/controller/login_states.dart';
import 'package:zetico/login_screen/model/login_model.dart';

import '../../app/services/location_helper/location_helper.dart';

class LoginBloc extends Cubit<LoginStates> {
  LoginBloc() : super(LoginInitState());
  static LoginBloc get(context) => BlocProvider.of(context);

  bool isShownPassword = true;
  Icon suffixPassword = const Icon(Icons.visibility_off);

  void changeVisibilityPassword() {
    isShownPassword = !isShownPassword;

    suffixPassword = isShownPassword
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility);

    emit(ChangeVisibilityPasswordState());
  }

 String? longitude;
  String? latitude;
  getCurrentPosition() async {
    await LocationHelper.getCurrentLocation().whenComplete(() {
      getLongitudeAndLatitude();
      emit(GetCurrentLocationState());
    });
    getLongitudeAndLatitude();
  }

  getLongitudeAndLatitude() async {
    return await LocationHelper.getCurrentLocation().then((value) {
      latitude = value.latitude.toString();
      longitude = value.longitude.toString();
      emit(GetLongitudeAndLatitudeState());
    });
  }

  LoginModel loginModel = LoginModel();
  void loginUser({
    required String email,
    required String password,
  }) {
    emit(LoginInitState());
    DioHelper.postData(path: ApiConstant.loginUserPath, data: {
      "Email": email,
      "Password": password,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        emit(LoginErrorState(error.toString()));
      }
    });
  }
}
