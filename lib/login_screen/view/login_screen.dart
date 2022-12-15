// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/common/widget.dart';
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
            message: AppStrings.messageError.tr(),
          );
        } else if (state is LoginSuccessState) {
          CacheHelper.setData(
            key: SharedKey.role,
            value: LoginBloc.get(context).loginModel.teamName,
          );
          CacheHelper.setData(
            key: SharedKey.token,
            value: LoginBloc.get(context).loginModel.token,
          );
          if (LoginBloc.get(context).loginModel.teamName == "Drivers") {
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
