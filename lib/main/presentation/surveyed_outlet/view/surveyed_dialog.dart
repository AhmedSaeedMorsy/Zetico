import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/app/common/widget.dart';
import 'package:zetico/app/resources/routes_manager.dart';
import 'package:zetico/main/presentation/edit_surveyed/view/edit_surveyed_screen.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../../../app/services/shared_prefrences/cache_helper.dart';
import '../../../models/survyed_outlet_model.dart';
import '../controller/survyed_bloc.dart';
import '../controller/survyed_states.dart';

Future showSurveyedDialog(
        BuildContext context, SurveyedResturantOutletModel outlet) =>
    showDialog(
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height / AppSize.s50,
          ),
          color: ColorManager.lightGrey,
        ),
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / AppSize.s8,
          horizontal: MediaQuery.of(context).size.height / AppSize.s20,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / AppSize.s50,
            horizontal: MediaQuery.of(context).size.width / AppSize.s30,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headText(
                  context,
                  AppStrings.outletDetails.tr(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s80,
                ),
                driver(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.outletNameEn.tr(),
                  outlet.outletNameEn!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.outletNameAr.tr(),
                  outlet.outletNameAr!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.city.tr(),
                  outlet.cityEn!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.area.tr(),
                  outlet.areaEn!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.phone.tr(),
                  outlet.phone!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.address.tr(),
                  outlet.addressDetail!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.location.tr(),
                  outlet.location!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                headText(
                  context,
                  AppStrings.surveyedDetials.tr(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s80,
                ),
                driver(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.pricePerKg.tr(),
                  outlet.priceKg!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.paymentMethod.tr(),
                  outlet.payment!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.oilType.tr(),
                  outlet.oilType!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.estimatedQt.tr(),
                  outlet.quantity!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.spaceOutlet.tr(),
                  outlet.outletSpace!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                BlocProvider(
                  create: (context) => SurveyedBloc(),
                  child: BlocConsumer<SurveyedBloc, SurveyedStates>(
                    listener: (context, state) {
                      if (state is ApproveSurvyedSuccessState ||
                          state is DeclinedSurvyedSuccessState) {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.homeRoute,
                        );
                      }
                    },
                    builder: (context, state) {
                      return Row(
                        children: [
                          button(
                            context,
                            AppStrings.approve.tr(),
                            () {
                              if (CacheHelper.getData(key: SharedKey.roleCreate)
                                  .toString()
                                  .contains("survey")) {
                                SurveyedBloc.get(context).approveSurvyed(
                                  outletId: outlet.outletId,
                                );
                              }
                              SharedWidget.toast(
                                  backgroundColor: ColorManager.yellow,
                                  message:
                                      AppStrings.permissionStringWarning.tr());
                            },
                          ),
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width / AppSize.s50,
                          ),
                          button(
                            context,
                            AppStrings.edit.tr(),
                            () {
                              if (CacheHelper.getData(key: SharedKey.roleEdit)
                                  .toString()
                                  .contains("survey")) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditSurveyed(
                                      outlet: outlet,
                                    ),
                                  ),
                                );
                              } else {
                                SharedWidget.toast(
                                    backgroundColor: ColorManager.yellow,
                                    message: AppStrings.permissionStringWarning
                                        .tr());
                              }
                            },
                          ),
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width / AppSize.s50,
                          ),
                          button(
                            context,
                            AppStrings.declined.tr(),
                            () {
                              if (CacheHelper.getData(key: SharedKey.roleDelete)
                                  .toString()
                                  .contains("survey")) {
                                SurveyedBloc.get(context).declinedSurveyed(
                                  outletId: outlet.outletId,
                                );
                              } else {
                                SharedWidget.toast(
                                    backgroundColor: ColorManager.yellow,
                                    message: AppStrings.permissionStringWarning
                                        .tr());
                              }
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

Widget headText(BuildContext context, String text) => Text(
      text,
      style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontSize: FontSizeManager.s16.sp,
          ),
    );
Widget driver() => Container(
      height: AppSize.s1.h,
      width: double.infinity,
      color: ColorManager.primaryColor,
    );

Widget bodyText(BuildContext context, String text, String bodyText) => Text(
      "$text  $bodyText",
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
            fontSize: FontSizeManager.s12.sp,
            color: ColorManager.grey,
          ),
    );
Widget button(context, String text, void Function() onPressed) => Expanded(
      child: Container(
        height: AppSize.s40.h,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: ColorManager.primaryColor,
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height / AppSize.s100,
          ),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: FontSizeManager.s12.sp,
                ),
          ),
        ),
      ),
    );
