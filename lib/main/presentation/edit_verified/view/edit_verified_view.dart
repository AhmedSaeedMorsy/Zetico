// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/main/main_controller/main_bloc.dart';
import 'package:zetico/main/main_controller/main_states.dart';
import 'package:zetico/main/presentation/edit_verified/controller/edit_verified_bloc.dart';
import 'package:zetico/main/presentation/edit_verified/controller/edit_verified_states.dart';
import '../../../../app/common/widget.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../../models/verfied_model.dart';

class EditVerifiedView extends StatelessWidget {
  EditVerifiedView({super.key, required this.outlet});
  VerfiedResturantOutletModel outlet;
  var formKey = GlobalKey<FormState>();
  final controllerNote = TextEditingController();
  String? area;
  late String city;
  late String payment;
  late String oilType;
  late String quantity;
  late String outletSpace;
  final controllerPrice = TextEditingController();
  final controllerEnglishName = TextEditingController();
  final controllerPhone = TextEditingController();
  final controllerArabicName = TextEditingController();
  final controllerAddress = TextEditingController();
  final controllerCustomerName = TextEditingController();
  final controllerLocation = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditVerifiedBloc, EditVerifiedStates>(
      listener: (context, state) {
        if (state is EditVerifiedSuccessState) {
          Navigator.pushReplacementNamed(
            context,
            Routes.homeRoute,
          );
        }
      },
      builder: (context, state) {
        controllerEnglishName.text = outlet.outletNameEn!;
          controllerArabicName.text = outlet.outletNameAr!;
          controllerPhone.text = outlet.phone!;
          controllerCustomerName.text = outlet.custName!;
          controllerNote.text = outlet.notes??"";
          controllerAddress.text = outlet.addressDetail!;
          controllerLocation.text = outlet.location!;
          area = outlet.areaEn!;
          quantity = outlet.quantity!;
          oilType = outlet.oilType!;
          payment = outlet.payment!;
          outletSpace = outlet.outletSpace!;
          city = outlet.cityEn!;
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / AppSize.s30,
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.outletDetails.tr(),
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: FontSizeManager.s26,
                              ),
                    ),
                  ),
                ),
                item(
                    context: context,
                    controller: controllerEnglishName,
                    textInputType: TextInputType.name,
                    label: AppStrings.outletNameByEnglish.tr(),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.nameOfEnglishValidate.tr();
                      }
                      return null;
                    }),
                item(
                    context: context,
                    controller: controllerArabicName,
                    textInputType: TextInputType.name,
                    label: AppStrings.outletNameByArabic.tr(),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.nameOfArabicValidate.tr();
                      }
                      return null;
                    }),
                item(
                    context: context,
                    controller: controllerPhone,
                    textInputType: TextInputType.name,
                    label: AppStrings.phone.tr(),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.phoneValidate.tr();
                      }
                      return null;
                    }),
                BlocBuilder<MainBloc, MainStates>(
                  builder: (context, state) {
                    return SharedWidget.cityAndArea(
                      cityName: city,
                      cityList: MainBloc.get(context).citises,
                      areaList: MainBloc.get(context).area,
                      context: context,
                      onChangedCity: (value) {
                        city = value!;
                        area = "";
                        MainBloc.get(context).getArea(
                          city: city,
                        );
                      },
                      validatorArea: (value) {
                        if (value == null) {
                          return AppStrings.areaValidateText.tr();
                        }
                        return null;
                      },
                      areaName: area!,
                      onChangedArea: (value) {
                        area = value!;
                      },
                    );
                  },
                ),
                item(
                    context: context,
                    controller: controllerAddress,
                    textInputType: TextInputType.text,
                    label: AppStrings.address.tr(),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.addressValidate.tr();
                      }
                      return null;
                    }),
                BlocBuilder<MainBloc, MainStates>(builder: (context, state) {
                  return Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: item(
                            context: context,
                            enabled: false,
                            controller: controllerLocation,
                            textInputType: TextInputType.none,
                            label: AppStrings.location.tr(),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.locationValidate.tr();
                              }
                              return null;
                            }),
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
                                    controllerLocation.text =
                                        "${MainBloc.get(context).longitude} , ${MainBloc.get(context).latitude}";
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
                }),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / AppSize.s30,
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.surveyedDetials.tr(),
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: FontSizeManager.s22,
                              ),
                    ),
                  ),
                ),
                item(
                    context: context,
                    controller: controllerPrice,
                    textInputType: TextInputType.number,
                    label: AppStrings.pricePerKg.tr(),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.priceValidate.tr();
                      }
                      return null;
                    }),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / AppSize.s100,
                    horizontal: MediaQuery.of(context).size.width / AppSize.s30,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.paymentMethod.tr(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  AppSize.s80,
                            ),
                            SharedWidget.dropDown(
                              hintText: payment,
                              list:[
    AppStrings.cashOnDelivery.tr(),
    AppStrings.postPoned.tr(),
  ],
                              onChanged: (value) {
                                payment = value!;
                              },
                            ),
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
                              AppStrings.oilType.tr(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  AppSize.s80,
                            ),
                            SharedWidget.dropDown(
                              hintText: oilType,
                              list: [
    AppStrings.canola.tr(),
    AppStrings.sunFlower.tr(),
    AppStrings.palm.tr(),
    AppStrings.olive.tr(),
  ],
                              onChanged: (value) {
                                oilType = value!;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / AppSize.s100,
                    horizontal: MediaQuery.of(context).size.width / AppSize.s30,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.estimatedQt.tr(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  AppSize.s80,
                            ),
                            SharedWidget.dropDown(
                              hintText: quantity,
                              list: [
                                AppStrings.zeroToFifty,
                                AppStrings.fiftytoHandred,
                                AppStrings.handredTofiftyHanderd,
                                AppStrings.fiftyHanderdToTowHandred,
                                AppStrings.towHandred,
                              ],
                              onChanged: (value) {
                                quantity = value!;
                              },
                            ),
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
                              AppStrings.outletSpace.tr(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  AppSize.s80,
                            ),
                            SharedWidget.dropDown(
                              hintText: outletSpace,
                              list: [
                                AppStrings.zeroToFifty,
                                AppStrings.fiftytoHandred,
                                AppStrings.handredTofiftyHanderd,
                                AppStrings.fiftyHanderdToTowHandred,
                                AppStrings.towHandred,
                              ],
                              onChanged: (value) {
                                outletSpace = value!;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                        AppStrings.note.tr(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s80,
                      ),
                      SizedBox(
                        height: AppSize.s100.h,
                        child: SharedWidget.defaultTextFormField(
                          controller: controllerNote,
                          textInputType: TextInputType.text,
                           paddding: AppSize.s30,
                          minLines: 5,
                          maxLines: 5,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / AppSize.s50,
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
                            borderRadius: BorderRadius.circular(AppSize.s150.h),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                EditVerifiedBloc.get(context).editVerified(
                                  outletNameEn: controllerEnglishName.text,
                                  outletNameAr: controllerArabicName.text,
                                  cityEn: city,
                                  areaEn: area!,
                                  custName: controllerCustomerName.text,
                                  phone: controllerPhone.text,
                                  addressDetail: controllerAddress.text,
                                  location: controllerLocation.text,
                                  sureyedBy: outlet.sureyedBy!,
                                  userType: outlet.userType!,
                                  priceKg: controllerPrice.text,
                                  payment: payment,
                                  oilType: oilType,
                                  quantity: quantity,
                                  outletSpace: outletSpace,
                                  notes: controllerNote.text,
                                  id: outlet.outletId,
                                );
                              }
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
                            borderRadius: BorderRadius.circular(AppSize.s150.h),
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
                SharedWidget.footer(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget item({
    required context,
    required TextEditingController controller,
    required TextInputType textInputType,
    required String label,
    String? Function(String?)? validator,
    bool? enabled,
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
              enabled: enabled,
              validator: validator,
            ),
          ],
        ),
      );
}
