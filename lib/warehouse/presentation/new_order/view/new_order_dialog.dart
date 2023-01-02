import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../collection/view/collection_screen.dart';

Future showNewOrderDialog(
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
          vertical: MediaQuery.of(context).size.height / AppSize.s20,
          horizontal: MediaQuery.of(context).size.height / AppSize.s20,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / AppSize.s50,
            horizontal: MediaQuery.of(context).size.width / AppSize.s30,
          ),
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
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(
                      vertical:
                          MediaQuery.of(context).size.height / AppSize.s40,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bodyText(
                          context,
                          AppStrings.outletName.tr(),
                          AppStrings.outletName.tr(),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height / AppSize.s50,
                        ),
                        bodyText(
                          context,
                          AppStrings.quantity.tr(),
                          AppStrings.quantity.tr(),
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => driver(),
                  itemCount: 10,
                ),
              ),
              Row(
                children: [
                  button(context, AppStrings.collect.tr(), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CollectionScreen(),
                      ),
                    );
                  }),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / AppSize.s50,
                  ),
                  button(
                    context,
                    AppStrings.declined.tr(),
                    () {
                      // add diolog to write resone
                    },
                  ),
                ],
              ),
            ],
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
