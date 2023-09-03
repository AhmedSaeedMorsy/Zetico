// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/app/resources/font_manager.dart';
import 'package:zetico/app/resources/language_manager.dart';
import 'package:zetico/login_screen/controller/login_bloc.dart';
import 'package:zetico/login_screen/controller/login_states.dart';
import '../../app/common/widget.dart';
import '../../app/resources/assets_manager.dart';
import '../../app/resources/color_manager.dart';
import '../../app/resources/routes_manager.dart';
import '../../app/resources/strings_manager.dart';
import '../../app/resources/values_manager.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool visibility = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
              colors: [
                ColorManager.firstgradientColor,
                ColorManager.scecondgradientColor,
                ColorManager.thirdgradientColor
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / AppSize.s50,
              horizontal: MediaQuery.of(context).size.width / AppSize.s20,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  langugeIcon(context),
                  Image(
                    image: const AssetImage(
                      AssetsManager.loginLogo,
                    ),
                    width: AppSize.s120.w,
                  ),
                  loginForm(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget langugeIcon(context) => Align(
        alignment: Alignment.topRight,
        child: InkWell(
          onTap: () {
            changeLanguage(context);
          },
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManager.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / AppSize.s50,
                horizontal: MediaQuery.of(context).size.width / AppSize.s80,
              ),
              child: Text(
                AppStrings.en.tr(),
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: FontSizeManager.s18.sp,
                    ),
              ),
            ),
          ),
        ),
      );
  Widget loginForm(context) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / AppSize.s80,
          horizontal: MediaQuery.of(context).size.width / AppSize.s22,
        ),
        child: BlocBuilder<LoginBloc, LoginStates>(
          builder: (context, state) => Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  AppStrings.welcome.tr(),
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: FontSizeManager.s22.sp,
                      ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s80,
                ),
                SharedWidget.defaultTextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) return AppStrings.emailValidation.tr();
                    return null;
                  },
                  hint: AppStrings.userName.tr(),
                  textInputType: TextInputType.emailAddress,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.person),
                    color: ColorManager.grey,
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s80,
                ),
                SharedWidget.defaultTextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.passwordValidation.tr();
                    }
                    return null;
                  },
                  hint: AppStrings.password.tr(),
                  textInputType: TextInputType.visiblePassword,
                  obscure: LoginBloc.get(context).isShownPassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      LoginBloc.get(context).changeVisibilityPassword();
                    },
                    icon: LoginBloc.get(context).suffixPassword,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s20,
                ),
                SharedWidget.defaultButton(
                  context,
                  () {
                    if (formKey.currentState!.validate()) {
                      LoginBloc.get(context).loginUser(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    }
                  },
                  AppStrings.login.tr(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s80,
                ),
                Container(
                  width: double.infinity,
                  height: AppSize.s40.h,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorManager.white,
                    ),
                    color: ColorManager.thirdgradientColor,
                    borderRadius: BorderRadius.circular(
                      AppSize.s12.h,
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.addOutletRegRoute,
                      );
                    },
                    child: Text(
                      AppStrings.onlineRegOutlet.tr(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: FontSizeManager.s16.sp,
                          ),
                    ),
                  ),
                ),
            SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s80,
                ),
                Container(
                  width: double.infinity,
                  height: AppSize.s40.h,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorManager.white,
                    ),
                    color: ColorManager.thirdgradientColor,
                    borderRadius: BorderRadius.circular(
                      AppSize.s12.h,
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.individualOrderRoute,
                      );
                    },
                    child: Text(
                      AppStrings.individualOrder.tr(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: FontSizeManager.s16.sp,
                          ),
                    ),
                  ),
                ),
            
              ],
            ),
          ),
        ),
      );
  void changeLanguage(context) {
    changeAppLanguage();
    Phoenix.rebirth(context);
  }
}
