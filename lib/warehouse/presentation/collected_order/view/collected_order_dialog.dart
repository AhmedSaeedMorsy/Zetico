import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import 'add_depreciation_order_dialog.dart';

Future showCollectedOrderDialog(
  BuildContext context,
) =>
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
          vertical: MediaQuery.of(context).size.height / AppSize.s3_6,
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
                  AppStrings.orderDetails.tr(),
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
                  AppStrings.driverName.tr(),
                  AppStrings.driverName.tr(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.licence.tr(),
                  AppStrings.licence.tr(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.date.tr(),
                  AppStrings.date.tr(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.requestQty.tr(),
                  AppStrings.requestQty.tr(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.collectedQty.tr(),
                  AppStrings.collectedQty.tr(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.receiveQty.tr(),
                  AppStrings.receiveQty.tr(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                button(context, AppStrings.addDepreciation.tr(), () {
                  showAddDepreciationOrderDialog(context);
                }),
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
Widget button(context, String text, void Function() onPressed) => Container(
      height: AppSize.s40.h,
      width: double.infinity,
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
    );
