// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/common/widget.dart';
import 'package:zetico/app/resources/color_manager.dart';
import 'package:zetico/app/resources/strings_manager.dart';
import 'package:zetico/app/services/shared_prefrences/cache_helper.dart';
import 'package:zetico/login_screen/controller/login_bloc.dart';
import 'package:zetico/login_screen/controller/login_states.dart';

import '../../app/resources/routes_manager.dart';
import 'login_view.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool visibility = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          SharedWidget.toast(
            backgroundColor: ColorManager.error,
            message: AppStrings.messageError.tr(),
          );
        } else if (state is LoginSuccessState) {
          CacheHelper.setData(
            key: SharedKey.cityEn,
            value: LoginBloc.get(context).loginModel.cityEn,
          );
          CacheHelper.setData(
            key: SharedKey.governorateEn,
            value: LoginBloc.get(context).loginModel.governorateEn,
          );
          CacheHelper.setData(
            key: SharedKey.mainTeamName,
            value: LoginBloc.get(context).loginModel.mainTeamName,
          );
          CacheHelper.setData(
            key: SharedKey.memberId,
            value: LoginBloc.get(context).loginModel.memberId,
          );
          CacheHelper.setData(
            key: SharedKey.memberMail,
            value: LoginBloc.get(context).loginModel.memberMail,
          );
          CacheHelper.setData(
            key: SharedKey.memberName,
            value: LoginBloc.get(context).loginModel.memberName,
          );
          CacheHelper.setData(
            key: SharedKey.memberPhone,
            value: LoginBloc.get(context).loginModel.memberPhone,
          );
          CacheHelper.setData(
            key: SharedKey.memberTitle,
            value: LoginBloc.get(context).loginModel.memberTitle,
          );
          CacheHelper.setData(
            key: SharedKey.role,
            value: LoginBloc.get(context).loginModel.teamName,
          );

          CacheHelper.setData(
            key: SharedKey.roleName,
            value: LoginBloc.get(context).loginModel.roleName,
          );

          CacheHelper.setData(
            key: SharedKey.token,
            value: LoginBloc.get(context).loginModel.token,
          );
          CacheHelper.setData(
            key: SharedKey.warehouseName,
            value: LoginBloc.get(context).loginModel.warehouseName,
          );
          if (LoginBloc.get(context).loginModel.teamName == "Drivers") {
            CacheHelper.setData(
              key: SharedKey.checkIn,
              value: false,
            );
            Navigator.pushReplacementNamed(
              context,
              Routes.homeDriverRoute,
            );
          } else {
            Navigator.pushReplacementNamed(
              context,
              Routes.homeRoute,
            );
          }
        }
      },
      child: LoginView(),
    );
  }
}
