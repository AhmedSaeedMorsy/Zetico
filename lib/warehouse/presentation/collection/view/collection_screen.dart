// ignore_for_file: must_be_immutable, library_prefixes

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';
import '../../../../app/common/widget.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import 'dart:ui' as UI;

class CollectionScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final problemController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controllerNote = TextEditingController();
  CollectionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.topRight,
              begin: Alignment.topLeft,
              colors: [
                ColorManager.firstgradientColor,
                ColorManager.scecondgradientColor,
                ColorManager.thirdgradientColor
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / AppSize.s30,
                    horizontal: MediaQuery.of(context).size.width / AppSize.s20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_sharp,
                              color: ColorManager.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications_sharp,
                              size: AppSize.s30.w,
                              color: ColorManager.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        AppStrings.collection.tr(),
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical:
                              MediaQuery.of(context).size.height / AppSize.s80,
                          horizontal:
                              MediaQuery.of(context).size.width / AppSize.s8,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: AppSize.s2.h,
                          color: ColorManager.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                        AppSize.s50.h,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          MediaQuery.of(context).size.width / AppSize.s18,
                      vertical:
                          MediaQuery.of(context).size.height / AppSize.s80,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppSize.s16,
                          ),
                          SharedWidget.defaultTextFormField(
                            controller: nameController,
                            textInputType: TextInputType.name,
                            enabled: false,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppSize.s16,
                          ),
                          Text(
                            AppStrings.kg,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppSize.s16,
                          ),
                          numberPickerItem(context),
                          SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppSize.s22,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (value) {},
                              ),
                              Text(
                                AppStrings.issuedString.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: ColorManager.black,
                                    ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppSize.s60,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorManager.primaryColor,
                                ),
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  // Accept or Declined on button text علي حسب  checkBox
                                },
                                child: Text(
                                  AppStrings.acceptOrder.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        fontSize: FontSizeManager.s12,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppSize.s22,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SharedWidget.footer(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget numberPickerItem(context) {
    UI.TextDirection direction = UI.TextDirection.ltr;

    return Directionality(
      textDirection: direction,
      child: Row(
        children: [
          numberpicker(
            context,
            0,
            (value) {},
          ),
          numberpicker(
            context,
            0,
            (value) {},
          ),
          numberpicker(
            context,
            0,
            (value) {},
          ),
          numberpicker(
            context,
            0,
            (value) {},
          ),
          Text(
            AppStrings.dot,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: FontSizeManager.s22,
                ),
          ),
          numberpicker(
            context,
            0,
            (value) {},
          ),
        ],
      ),
    );
  }

  Widget numberpicker(context, currentValue, void Function(int) onChanged) =>
      NumberPicker(
        value: currentValue,
        textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(),
        minValue: 0,
        maxValue: 9,
        itemWidth: AppSize.s60.w,
        onChanged: onChanged,
      );
}
