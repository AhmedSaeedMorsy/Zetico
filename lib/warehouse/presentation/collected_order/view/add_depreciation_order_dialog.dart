import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';

Future showAddDepreciationOrderDialog(
  BuildContext context,
) =>
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            AppStrings.addDepreciation.tr(),
          ),
          content: TextField(
            onSubmitted: (value) {},
            controller: TextEditingController(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: AppStrings.kg,
            ),
          ),
          actions: [
            button(context, AppStrings.accept.tr(), () {
              Navigator.pushNamed(
                context,
                Routes.homeWarehouseRoute,
              );
            })
          ],
        );
      },
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
