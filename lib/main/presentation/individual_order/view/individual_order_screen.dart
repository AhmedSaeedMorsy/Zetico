import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/common/widget.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../../main_controller/main_bloc.dart';
import '../../../main_controller/main_states.dart';

class IndividualOrderScreen extends StatelessWidget {
  const IndividualOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.individualOrder.tr(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: FontSizeManager.s14.sp,
                ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / AppSize.s50,
            horizontal: MediaQuery.of(context).size.width / AppSize.s30,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                item(
                  context: context,
                  controller: TextEditingController(),
                  textInputType: TextInputType.name,
                  label: AppStrings.name.tr(),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppStrings.nameValidation.tr();
                    }
                    return null;
                  },
                ),
                item(
                  context: context,
                  controller: TextEditingController(),
                  textInputType: TextInputType.phone,
                  label: AppStrings.phone.tr(),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppStrings.phoneValidate.tr();
                    }
                    return null;
                  },
                ),
                BlocBuilder<MainBloc, MainStates>(
                  builder: (context, state) {
                    return SharedWidget.cityAndArea(
                      cityName:
                          //  city ??
                          AppStrings.city.tr(),
                      context: context,
                      cityList: MainBloc.get(context).citises,
                      areaList: MainBloc.get(context).area,
                      validatorCity: (value) {
                        if (value == null) {
                          return AppStrings.cityValidateText.tr();
                        }
                        return null;
                      },
                      validatorArea: (value) {
                        if (value == null) {
                          return AppStrings.areaValidateText.tr();
                        }
                        return null;
                      },
                      onChangedCity: (value) {
                        // city = value;
                        // area = null;
                        // MainBloc.get(context).getArea(
                        //   // city: city!,
                        // );
                      },
                      areaName:
                          // area ??
                          AppStrings.area.tr(),
                      onChangedArea: (value) {
                        // area = value;
                      },
                    );
                  },
                ),
                item(
                  context: context,
                  controller: TextEditingController(),
                  textInputType: TextInputType.text,
                  label: AppStrings.address.tr(),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppStrings.addressValidate.tr();
                    }
                    return null;
                  },
                ),
                BlocBuilder<MainBloc, MainStates>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: item(
                            context: context,
                            controller: TextEditingController(),
                            textInputType: TextInputType.number,
                            label: AppStrings.location.tr(),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return AppStrings.locationValidate.tr();
                              }
                              return null;
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height /
                                    AppSize.s22,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: MediaQuery.of(context).size.width /
                                      AppSize.s30,
                                ),
                                child: Container(
                                  height: AppSize.s40.h,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      AppSize.s150.w,
                                    ),
                                    border: Border.all(
                                      color: ColorManager.primaryColor,
                                    ),
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {
                                      // controllerLocation.text =
                                      //     "${MainBloc.get(context).latitude} , ${MainBloc.get(context).longitude}";
                                    },
                                    child: Text(
                                      AppStrings.getLocation.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontSize: FontSizeManager.s14.sp,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / AppSize.s100,
                    horizontal: MediaQuery.of(context).size.width / AppSize.s30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.oilType.tr(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s80,
                      ),
                      SharedWidget.dropDown(
                        hintText: AppStrings.oilType.tr(),
                        list: [
                          AppStrings.canola.tr(),
                          AppStrings.sunFlower.tr(),
                          AppStrings.palm.tr(),
                          AppStrings.olive.tr(),
                        ],
                        onChanged: (value) {
                          // oilType = value;
                        },
                        validator: (String? value) {
                          if (value == null) {
                            return AppStrings.oilTypeValidateText.tr();
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                item(
                  context: context,
                  controller: TextEditingController(),
                  textInputType: TextInputType.number,
                  label: AppStrings.quantity.tr(),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppStrings.quantityValidateText.tr();
                    }
                    return null;
                  },
                ),
                item(
                  context: context,
                  controller: TextEditingController(),
                  textInputType: TextInputType.none,
                  label: AppStrings.date.tr(),
                  validator: (String? value) {
                    return null;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: item(
                        context: context,
                        controller: TextEditingController(),
                        textInputType: TextInputType.none,
                        label: AppStrings.startTime.tr(),
                        validator: (String? value) {
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / AppSize.s50,
                    ),
                    Expanded(
                      child: item(
                        context: context,
                        controller: TextEditingController(),
                        textInputType: TextInputType.none,
                        label: AppStrings.endTime.tr(),
                        validator: (String? value) {
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / AppSize.s30,
                    horizontal: MediaQuery.of(context).size.width / AppSize.s30,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: AppSize.s40.h,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color: ColorManager.primaryColor,
                            borderRadius: BorderRadius.circular(
                              AppSize.s150.h,
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              AppStrings.submit.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: FontSizeManager.s12.sp,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / AppSize.s30,
                      ),
                      Expanded(
                        child: Container(
                          height: AppSize.s40.h,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppSize.s150.h,
                            ),
                            border: Border.all(
                              color: ColorManager.primaryColor,
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              AppStrings.cancel.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: FontSizeManager.s12.sp,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget item({
    required context,
    required TextEditingController controller,
    required TextInputType textInputType,
    required String label,
    required String? Function(String?)? validator,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / AppSize.s100,
          horizontal: MediaQuery.of(context).size.width / AppSize.s30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s80,
            ),
            SharedWidget.defaultTextFormField(
              controller: controller,
              textInputType: textInputType,
              hint: label,
              validator: validator,
            ),
          ],
        ),
      );
}
