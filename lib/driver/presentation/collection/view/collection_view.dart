// ignore_for_file: must_be_immutable, library_prefixes

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:zetico/driver/model/issues_model.dart';
import 'package:zetico/driver/presentation/collection/controller/collection_order_bloc.dart';
import 'package:zetico/driver/presentation/collection/controller/collection_order_states.dart';
import '../../../../app/common/widget.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../../model/on_progress_order_model.dart';
import 'dialog_isuues_collection.dart';
import 'dart:ui' as UI;

class CollectionView extends StatelessWidget {
  final nameController = TextEditingController();
  final problemController = TextEditingController();
  ItemModel? result;
  final formKey = GlobalKey<FormState>();
  OnProgressItemModel order;
  final controllerNote = TextEditingController();
  CollectionView({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CollectionOrderBloc, CollectionOrderStates>(
        listener: (context, state) {
      if (state is PostIssuedSuccessState ||
          state is CollectionOrderSuccessState) {
        Navigator.pushReplacementNamed(
          context,
          Routes.homeDriverRoute,
        );
      }
    }, builder: (context, state) {
      nameController.text = order.outletNameAr;
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
                      vertical:
                          MediaQuery.of(context).size.height / AppSize.s30,
                      horizontal:
                          MediaQuery.of(context).size.width / AppSize.s20,
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
                            vertical: MediaQuery.of(context).size.height /
                                AppSize.s80,
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
                            Center(
                              child: Text(
                                AppStrings.estimatedPrice.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      fontSize: FontSizeManager.s22,
                                    ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  AppSize.s22,
                            ),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorManager.white,
                                  border: Border.all(
                                    color: ColorManager.grey,
                                  ),
                                ),
                                height: AppSize.s50.h,
                                width: AppSize.s100.w,
                                child: Center(
                                  child: Text(
                                    "${CollectionOrderBloc.get(context).getPrice(double.parse(order.priceKg))}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontSize: FontSizeManager.s18.sp,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  AppSize.s60,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: CollectionOrderBloc.get(context)
                                      .isChecked,
                                  onChanged: (value) {
                                    CollectionOrderBloc.get(context)
                                        .changeCheckBox();
                                  },
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
                            if (CollectionOrderBloc.get(context).isChecked ==
                                true)
                              problemItem(context),
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
                                    if (CollectionOrderBloc.get(context)
                                            .isChecked ==
                                        true) {
                                      if (formKey.currentState!.validate()) {
                                        CollectionOrderBloc.get(context)
                                            .postIssuesOrder(
                                          orderId: order.onProgressId,
                                          issueId: result!.issuedId!,
                                          issueDate: DateTime.now().toString(),
                                          issueComment: controllerNote.text,
                                        );
                                      }
                                    } else if (CollectionOrderBloc.get(context)
                                            .quantity !=
                                        0) {
                                      CollectionOrderBloc.get(context)
                                          .postCollectionOrder(
                                        orderId: order.onProgressId,
                                        collectedQuantity:
                                            "${CollectionOrderBloc.get(context).quantity}",
                                      );
                                    }
                                  },
                                  child: Text(
                                    AppStrings.confirm.tr(),
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
    });
  }

  Widget numberPickerItem(context) {
    UI.TextDirection direction = UI.TextDirection.ltr;

    return Directionality(
      textDirection: direction,
      child: Row(
        children: [
          numberpicker(
            context,
            CollectionOrderBloc.get(context).currentThousandsValue,
            (value) {
              CollectionOrderBloc.get(context)
                  .changeThousandsNumberPicker(value);
            },
          ),
          numberpicker(
              context, CollectionOrderBloc.get(context).currentHundredValue,
              (value) {
            CollectionOrderBloc.get(context).changeHundredNumberPicker(value);
          }),
          numberpicker(
              context, CollectionOrderBloc.get(context).currentDozensValue,
              (value) {
            CollectionOrderBloc.get(context).changeDozensNumberPicker(value);
          }),
          numberpicker(
              context, CollectionOrderBloc.get(context).currentOnesValue,
              (value) {
            CollectionOrderBloc.get(context).changeOnesNumberPicker(value);
          }),
          Text(
            AppStrings.dot,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: FontSizeManager.s22,
                ),
          ),
          numberpicker(
              context, CollectionOrderBloc.get(context).currentDecimalValue,
              (value) {
            CollectionOrderBloc.get(context).changeDecimalNumberPicker(value);
          }),
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
  Widget problemItem(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.problem.tr(),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: ColorManager.black,
                ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s80,
          ),
          SharedWidget.defaultTextFormField(
            controller: problemController,
            textInputType: TextInputType.none,
            validator: (value) {
              if (value!.isEmpty) {
                return AppStrings.required.tr();
              }
              return null;
            },
            onTap: () async {
              result = await showDialogCollection(context);
              problemController.text = result!.issuedName!;
            },
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.arrow_drop_down,
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s80,
          ),
          Text(
            AppStrings.note.tr(),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: ColorManager.black,
                ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s80,
          ),
          SizedBox(
            height: AppSize.s100.h,
            child: SharedWidget.defaultTextFormField(
              paddding: AppSize.s30,
              controller: controllerNote,
              textInputType: TextInputType.text,
              minLines: 5,
              maxLines: 5,
            ),
          ),
        ],
      ),
    );
  }
}
