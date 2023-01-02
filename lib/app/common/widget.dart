import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zetico/app/resources/font_manager.dart';
import 'package:zetico/main/main_controller/main_bloc.dart';
import 'package:zetico/main/main_controller/main_states.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/language_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import '../services/shared_prefrences/cache_helper.dart';

class SharedWidget {
  static Widget defaultTextFormField({
    final TextEditingController? controller,
    required TextInputType textInputType,
    bool obscure = false,
    void Function(String?)? onChange,
    void Function()? onTap,
    String? hint,
    bool? enabled,
    String? Function(String?)? validator,
    IconButton? suffixIcon,
    void Function(String)? onFieldSubmitted,
    int maxLines = 1,
    double paddding = AppSize.s10,
    int minLines = 1,
  }) =>
      TextFormField(
        controller: controller,
        cursorColor: ColorManager.primaryColor,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          fillColor: ColorManager.white, filled: true,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                AppSize.s100.h,
              ),
            ),
          ),

          contentPadding: EdgeInsets.symmetric(
              vertical: AppSize.s10.h, horizontal: paddding.w),
          // hint style
          hintStyle: getRegularStyle(
            color: ColorManager.grey,
          ),
        ),
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChange,
        onTap: onTap,
        enabled: enabled,
        minLines: minLines,
        validator: validator,
        keyboardType: textInputType,
        maxLines: maxLines,
      );

  // static Widget noItemWidget(context) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       SvgPicture.asset(AssetsManager.empty,),
  //       const SizedBox(
  //         height: AppSize.s30,
  //       ),
  //       Text(
  //         AppStrings.cartEmpty,
  //         style: Theme.of(context).textTheme.bodyLarge,
  //       ),
  //       const SizedBox(
  //         height: AppSize.s20,
  //       ),
  //       Text(
  //         AppStrings.emptyBio,
  //         style: Theme.of(context).textTheme.displayLarge,
  //       ),
  //     ],
  //   );
  // }

  static toast({required String message,required Color backgroundColor}) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: backgroundColor,
      textColor: ColorManager.white,
      fontSize: FontSizeManager.s16.sp,
    );
  }

static Widget drawer({required BuildContext context,required String name,required String phone,}) => Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration:
                  const BoxDecoration(color: ColorManager.thirdgradientColor),
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.height / AppSize.s50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: FontSizeManager.s18.sp,
                        ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s80,
                  ),
                  Text(
                    phone,overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: FontSizeManager.s18.sp,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s22,
            ),
            ListTile(
              leading: Image.asset(
                AssetsManager.settings,
              ),
              title: Text(
                AppStrings.language.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () {
                changeLanguage(context);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s22,
            ),
            ListTile(
              leading: Image.asset(
                AssetsManager.settings,
              ),
              title: Text(
                AppStrings.editProfile.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s22,
            ),
            ListTile(
              leading: Image.asset(
                AssetsManager.logOut,
              ),
              title: Text(
                AppStrings.logOut.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () {
               CacheHelper.removeData(
                  key: SharedKey.cityEn,
                );
                CacheHelper.removeData(
                  key: SharedKey.governorateEn,
                );
                CacheHelper.removeData(
                  key: SharedKey.mainTeamName,
                );
                CacheHelper.removeData(
                  key: SharedKey.memberId,
                );
                  CacheHelper.removeData(
                  key: SharedKey.memberMail,
                );
                  CacheHelper.removeData(
                  key: SharedKey.memberName,
                );
                  CacheHelper.removeData(
                  key: SharedKey.memberPhone,
                );
                  CacheHelper.removeData(
                  key: SharedKey.memberTitle,
                );
                  CacheHelper.removeData(
                  key: SharedKey.role,
                );
                  CacheHelper.removeData(
                  key: SharedKey.roleCreate,
                );
                  CacheHelper.removeData(
                  key: SharedKey.roleDelete,
                );
                  CacheHelper.removeData(
                  key: SharedKey.roleEdit,
                );
                  CacheHelper.removeData(
                  key: SharedKey.roleName,
                );
                  CacheHelper.removeData(
                  key: SharedKey.roleSpecial,
                );
                  CacheHelper.removeData(
                  key: SharedKey.token,
                );
                  CacheHelper.removeData(
                  key: SharedKey.warehouseName,
                );
                    CacheHelper.removeData(
                  key: SharedKey.checkIn,
                );
                Navigator.pushReplacementNamed(
                  context,
                  Routes.loginRoute,
                );
              },
            ),
          ],
        ),
      );

static  void changeLanguage(context) {
    changeAppLanguage();
    Phoenix.rebirth(context);
  }

  static Widget defaultButton(
      BuildContext context, Function() function, String text) {
    return Container(
      height: AppSize.s40.h,
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: ColorManager.primaryColor,
        borderRadius: BorderRadius.circular(
          AppSize.s12.h,
        ),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: FontSizeManager.s14.sp),
        ),
      ),
    );
  }

  static Widget dropDown({
    required String hintText,
    required List<String> list,
    void Function(String?)? onChanged,
    final FormFieldSetter? onSaved,
    final String? validateText,
    String? Function(String?)? validator,
  }) =>
      DropdownButtonFormField2(
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: AppSize.s10.h,
            horizontal: AppSize.s10.w,
          ),
          fillColor: ColorManager.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                AppSize.s100.h,
              ),
            ),
          ),
        ),
        hint: Text(
          hintText,
          style: TextStyle(
            fontSize: FontSizeManager.s16.sp,
            color: ColorManager.grey,
          ),
        ),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: ColorManager.black,
        ),
        iconSize: AppSize.s20.w,
        buttonHeight: AppSize.s30.w,
        items: list
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: FontSizeManager.s12.sp,
                    color: ColorManager.black,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
      );

  static Widget footer(BuildContext context) => Container(
        height: AppSize.s60.h,
        decoration: BoxDecoration(color: ColorManager.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(
              0,
              3,
            ), // changes position of shadow
          ),
        ]),
        width: double.infinity,
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width / AppSize.s30,
              horizontal: MediaQuery.of(context).size.width / AppSize.s25,
            ),
            child: Image(
              image: const AssetImage(
                AssetsManager.horizontalLogo,
              ),
              width: AppSize.s80.w,
            ),
          ),
        ),
      );

  static circleContainer() => Container(
        width: AppSize.s60.w,
        height: AppSize.s60.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: AppSize.s2.w,
            color: ColorManager.thirdgradientColor,
          ),
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 10,
              color: ColorManager.white.withOpacity(.1),
              offset: const Offset(0, 10),
            ),
          ],
        ),
      );

  static Widget cityAndArea({
    required String cityName,
    required context,
    required void Function(String?) onChangedCity,
    required String areaName,
    required List<String> areaList,
    required List<String> cityList,
    required void Function(String?) onChangedArea,
    String? Function(String?)? validatorCity,
    String? Function(String?)? validatorArea,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / AppSize.s100,
          horizontal: MediaQuery.of(context).size.width / AppSize.s30,
        ),
        child: BlocBuilder<MainBloc, MainStates>(
          builder: (context, state) {
            return Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.city.tr(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s80,
                      ),
                      SharedWidget.dropDown(
                          hintText: cityName,
                          list: cityList,
                          onChanged: onChangedCity,
                          validator: validatorCity),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / AppSize.s30,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.area.tr(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s80,
                      ),
                      ConditionalBuilderRec(
                        condition: state is GetAreaSuccessState,
                        builder: (context) => SharedWidget.dropDown(
                            hintText: areaName,
                            list: areaList,
                            onChanged: onChangedArea,
                            validator: validatorArea),
                        fallback: (context) =>
                            SharedWidget.defaultTextFormField(
                          controller: TextEditingController(),
                          enabled: false,
                          textInputType: TextInputType.none,
                          hint: areaName,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );

  static Widget searchItem({
    required TextEditingController controller,
    required BuildContext context,
    required TextInputType textInputType,
    bool obscure = false,
    void Function(String?)? onChange,
    void Function()? onTap,
    String? hint,
    bool? enabled,
    Icon? suffixIcon,
    void Function(String)? onFieldSubmitted,
    int maxLines = 1,
    int minLines = 1,
  }) =>
      Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / AppSize.s180,
            horizontal: MediaQuery.of(context).size.width / AppSize.s50,
          ),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  AppSize.s100.h,
                ),
              ),
              border: Border.all(
                color: ColorManager.grey,
              ),
            ),
            width: double.infinity,
            height: AppSize.s40.h,
            child: TextFormField(
              cursorColor: ColorManager.primaryColor,
              obscureText: obscure,
              decoration: InputDecoration(
                hintText: hint,
                suffixIcon: suffixIcon,
                border: InputBorder.none,

                contentPadding: EdgeInsets.symmetric(
                    vertical: AppSize.s10.h, horizontal: AppSize.s10.w),
                // hint style
                hintStyle: getRegularStyle(
                  color: ColorManager.grey,
                ),
              ),
              onFieldSubmitted: onFieldSubmitted,
              onChanged: onChange,
              onTap: onTap,
              enabled: enabled,
              minLines: minLines,
              controller: controller,
              keyboardType: textInputType,
              maxLines: maxLines,
            ),
          ));
}


    // number of notification
                                    // Container(
                                    //   padding: EdgeInsets.all(
                                    //     MediaQuery.of(context).size.width /
                                    //         AppSize.s100,
                                    //   ),
                                    //   clipBehavior: Clip.antiAliasWithSaveLayer,
                                    //   decoration: BoxDecoration(
                                    //     color: ColorManager.error,
                                    //     shape: BoxShape.circle,
                                    //   ),
                                    //   child: Text(
                                    //     AppStrings.three,
                                    //     style: Theme.of(context)
                                    //         .textTheme
                                    //         .bodySmall!
                                    //         .copyWith(
                                    //           fontSize: FontSizeManager.s16.sp,
                                    //         ),
                                    //   ),
                                    // ),