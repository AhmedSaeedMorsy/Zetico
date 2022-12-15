import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/main/models/issued_order_model.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';

Future showIssuedOrdersDialog(BuildContext context, IssuedModel order) =>
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
          horizontal: MediaQuery.of(context).size.height / AppSize.s150,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / AppSize.s50,
            horizontal: MediaQuery.of(context).size.width / AppSize.s80,
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
                  order.outletNameEn!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.phone.tr(),
                  order.phone!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.city.tr(),
                  order.cityEn!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.area.tr(),
                  order.areaEn!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.pricePerKg.tr(),
                  order.priceKg!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
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
                  AppStrings.requestQty.tr(),
                  order.onProgressQuantity!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.date.tr(),
                  order.issueDate!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.expectedCollectionDate.tr(),
                  order.collectDate!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.creationDate.tr(),
                  order.creationDate!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.orderCreatedBy.tr(),
                  order.createdBy!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.assignDriver.tr(),
                  order.assignedDriver!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.assignedDate.tr(),
                  order.assignedDate!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.assignedBy.tr(),
                  order.assignedBy!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.issueComment.tr(),
                  order.issueComment ?? "",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.issueDate.tr(),
                  order.issueDate??"",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                headText(
                  context,
                  AppStrings.contactDetails.tr(),
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
                  AppStrings.name.tr(),
                  order.custName??"",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(context, AppStrings.phone.tr(), order.custPhone!),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                headText(
                  context,
                  AppStrings.driverDetails.tr(),
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
                  AppStrings.name.tr(),
                  order.memberName??"",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.phone.tr(),
                  order.memberPhone??"",
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
