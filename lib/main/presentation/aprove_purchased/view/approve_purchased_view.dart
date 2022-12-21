// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/common/widget.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../../main_controller/main_bloc.dart';
import '../../../main_controller/main_states.dart';
import '../../../models/purchsed_model.dart';
import '../controller/approve_purchased_bloc.dart';
import '../controller/approve_purchased_states.dart';

class ApprovePurchasedView extends StatelessWidget {
  ApprovePurchasedView({
    super.key,
    required this.outlet,
  });
  PurchsedResturantOutletModel outlet;
  final controllerEnglishName = TextEditingController();
  final controllerPhone = TextEditingController();
  final controllerArabicName = TextEditingController();
  final controllerEstimated = TextEditingController();
  final controllerLocation = TextEditingController();
  final controllerAddress = TextEditingController();
  final controllerContactName1 = TextEditingController();
  final controllerContactName2 = TextEditingController();
  final controllerMobile1 = TextEditingController();
  final controllerMobile2 = TextEditingController();
  final controllerTitle1 = TextEditingController();
  final controllerTitle2 = TextEditingController();
  final controllerSurveydBy = TextEditingController();
  final controllerAgreementBy = TextEditingController();
  final controllerSurveydByDate = TextEditingController();
  final controllerAgreementByDate = TextEditingController();
  final controllerAgreementStartDate = TextEditingController();
  final controllerAgreementEndDate = TextEditingController();
  final controllerPrice = TextEditingController();
  final controllerUserName = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerApprovedBy = TextEditingController();
  final controllerApprovedByDate = TextEditingController();
  String? name;
  bool? isChecked = false;
  String? area;
  late String city;
  late String payment;
  late String oilType;
  late String quantity;
  late String outletSpace;
  String? custRole;
  String? workerRole;
  bool contract = false;
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApprovePurchasedBloc, ApprovePurchasedStates>(
        listener: (context, state) {
      if (state is ApprovePurchasedSuccessStates) {
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
      }
    }, builder: (context, state) {
      controllerEnglishName.text = outlet.outletNameEn!;
      controllerArabicName.text = outlet.outletNameAr!;
      controllerPhone.text = outlet.phone!;
      controllerAddress.text = outlet.addressDetail!;
      controllerLocation.text = outlet.location!;
      area = outlet.areaEn;
      quantity = outlet.quantity!;
      oilType = outlet.oilType!;
      payment = outlet.payment!;
      outletSpace = outlet.outletSpace!;
      city = outlet.cityEn!;
      controllerAgreementByDate.text = outlet.agreementDate!;
      controllerAgreementStartDate.text = outlet.startDate!;
      controllerAgreementEndDate.text = outlet.endDate!;
      controllerSurveydBy.text = outlet.custName!;
      controllerSurveydByDate.text = outlet.date!;
      controllerPrice.text = outlet.priceKg!;
      controllerApprovedBy.text = outlet.approveName!;
      controllerApprovedByDate.text = outlet.approveDate!;
      return Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / AppSize.s30,
                ),
                child: Center(
                  child: Text(
                    AppStrings.outletDetails.tr(),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: FontSizeManager.s26.sp,
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
                  textInputType: TextInputType.phone,
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
                    cityList: MainBloc.get(context).citises,
                    areaList: MainBloc.get(context).area,
                    cityName: city,
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
                    areaName: area ?? "",
                    onChangedArea: (value) {
                      area = value;
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
                                      "${MainBloc.get(context).latitude} , ${MainBloc.get(context).longitude}";
                                },
                                child: Text(
                                  AppStrings.getLocation.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      !.copyWith(
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
                    AppStrings.contactDetails.tr(),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: FontSizeManager.s26.sp,
                        ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: item(
                        context: context,
                        controller: controllerContactName1,
                        textInputType: TextInputType.name,
                        label: AppStrings.contactName.tr(),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.nameValidation.tr();
                          }
                          return null;
                        }),
                  ),
                  Expanded(
                    child: item(
                        context: context,
                        controller: controllerMobile1,
                        textInputType: TextInputType.phone,
                        label: AppStrings.mobile.tr(),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.phoneValidation.tr();
                          }
                          return null;
                        }),
                  ),
                ],
              ),
              itemDropDown(
                  context: context,
                  list: [
    AppStrings.worker.tr(),
    AppStrings.chef.tr(),
    AppStrings.operationManager.tr(),
    AppStrings.generalManager.tr(),
  ],
                  onChange: (value) {
                    custRole = value;
                  },
                  validateText: AppStrings.titleValidateText.tr(),
                  title: AppStrings.title.tr(),
                  hint: AppStrings.title.tr(),
                  validator: (value) {
                    if (value == null) {
                      return AppStrings.titleValidate.tr();
                    }
                    return null;
                  }),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / AppSize.s30,
                ),
                child: Center(
                  child: Text(
                    AppStrings.secondContactDetails.tr(),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: FontSizeManager.s26.sp,
                        ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: item(
                        context: context,
                        controller: controllerContactName2,
                        textInputType: TextInputType.name,
                        label: AppStrings.contactName.tr(),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.nameValidation.tr();
                          }
                          return null;
                        }),
                  ),
                  Expanded(
                    child: item(
                        context: context,
                        controller: controllerMobile2,
                        textInputType: TextInputType.phone,
                        label: AppStrings.mobile.tr(),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.phoneValidation.tr();
                          }
                          return null;
                        }),
                  ),
                ],
              ),
              itemDropDown(
                context: context,
                list: [
    AppStrings.worker.tr(),
    AppStrings.chef.tr(),
    AppStrings.operationManager.tr(),
    AppStrings.generalManager.tr(),
  ],
                hint: AppStrings.title.tr(),
                validateText: AppStrings.titleValidateText.tr(),
                title: AppStrings.title.tr(),
                validator: (value) {
                  if (value == null) {
                    return AppStrings.titleValidate.tr();
                  }
                  return null;
                },
                onChange: (value) {
                  workerRole = value;
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / AppSize.s30,
                ),
                child: Center(
                  child: Text(
                    AppStrings.agreementDetails.tr(),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: FontSizeManager.s26.sp,
                        ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: item(
                      context: context,
                      controller: controllerSurveydBy,
                      textInputType: TextInputType.name,
                      label: AppStrings.surveyedBy.tr(),
                      enabled: false,
                    ),
                  ),
                  Expanded(
                    child: item(
                      context: context,
                      controller: controllerAgreementBy,
                      textInputType: TextInputType.name,
                      label: AppStrings.agreementBy.tr(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.agreementValidate.tr();
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: item(
                      context: context,
                      controller: controllerSurveydByDate,
                      textInputType: TextInputType.datetime,
                      label: AppStrings.surveyedDate.tr(),
                      enabled: false,
                    ),
                  ),
                  Expanded(
                    child: item(
                      context: context,
                      controller: controllerAgreementByDate,
                      textInputType: TextInputType.datetime,
                      label: AppStrings.agreementDate.tr(),
                      enabled: false,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: item(
                      context: context,
                      enabled: false,
                      controller: controllerAgreementStartDate,
                      textInputType: TextInputType.none,
                      label: AppStrings.agreementStartDate.tr(),
                      suffixIcon: const Icon(
                        Icons.calendar_month,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.agreementStartDateValidate.tr();
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: item(
                      context: context,
                      enabled: false,
                      controller: controllerAgreementEndDate,
                      textInputType: TextInputType.none,
                      label: AppStrings.agreementEndDate.tr(),
                      suffixIcon: const Icon(
                        Icons.calendar_month,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.agreementEndDateValidate.tr();
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: item(
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
                  ),
                  Expanded(
                    child: itemDropDown(
                      hint: payment,
                      context: context,
                      validateText: AppStrings.paymentMethodValidateText.tr(),
                      list:[
    AppStrings.cashOnDelivery.tr(),
    AppStrings.postPoned.tr(),
  ],
                      onChange: (String? value) {
                        payment = value!;
                      },
                      title: AppStrings.paymentMethod.tr(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: itemDropDown(
                      context: context,
                      hint: oilType,
                      list: [
    AppStrings.canola.tr(),
    AppStrings.sunFlower.tr(),
    AppStrings.palm.tr(),
    AppStrings.olive.tr(),
  ],
                      validateText: AppStrings.oilTypeValidateText.tr(),
                      onChange: (String? value) {
                        oilType = value!;
                      },
                      title: AppStrings.oilType.tr(),
                    ),
                  ),
                  Expanded(
                    child: itemDropDown(
                      context: context,
                      hint: quantity,
                      list: [
                        AppStrings.zeroToFifty,
                        AppStrings.fiftytoHandred,
                        AppStrings.handredTofiftyHanderd,
                        AppStrings.fiftyHanderdToTowHandred,
                        AppStrings.towHandred,
                      ],
                      onChange: (String? value) {
                        quantity = value!;
                      },
                      validateText: AppStrings.quantityValidateText.tr(),
                      title: AppStrings.estimatedQt.tr(),
                    ),
                  ),
                ],
              ),
              itemDropDown(
                context: context,
                validateText: AppStrings.outletSpaceValidateText.tr(),
                list: [
                  AppStrings.zeroToFifty,
                  AppStrings.fiftytoHandred,
                  AppStrings.handredTofiftyHanderd,
                  AppStrings.fiftyHanderdToTowHandred,
                  AppStrings.towHandred,
                ],
                hint: outletSpace,
                onChange: (String? value) {
                  outletSpace = value!;
                },
                title: AppStrings.outletSpace.tr(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / AppSize.s30,
                  horizontal: MediaQuery.of(context).size.width / AppSize.s30,
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: ApprovePurchasedBloc.get(context).contract,
                      onChanged: ((value) {
                        ApprovePurchasedBloc.get(context).changeContract();
                        contract = ApprovePurchasedBloc.get(context).contract;
                      }),
                    ),
                    Text(
                      AppStrings.contract.tr(),
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: FontSizeManager.s18.sp,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / AppSize.s30,
                ),
                child: Center(
                  child: Text(
                    AppStrings.accountLoginDetails.tr(),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: FontSizeManager.s26.sp,
                        ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: item(
                      context: context,
                      controller: controllerUserName,
                      textInputType: TextInputType.name,
                      label: AppStrings.userName.tr(),
                    ),
                  ),
                  Expanded(
                    child: item(
                      context: context,
                      controller: controllerPassword,
                      textInputType: TextInputType.visiblePassword,
                      label: AppStrings.password.tr(),
                    ),
                  ),
                ],
              ),
              item(
                context: context,
                controller: controllerEmail,
                textInputType: TextInputType.emailAddress,
                label: AppStrings.email,
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
                          borderRadius: BorderRadius.circular(AppSize.s150.h),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              ApprovePurchasedBloc.get(context)
                                  .approvePurchased(
                                outletNameEn: controllerEnglishName.text,
                                outletNameAr: controllerArabicName.text,
                                cityEn: city,
                                areaEn: area!,
                                custName: controllerContactName1.text,
                                phone: controllerMobile1.text,
                                addressDetail: controllerAddress.text,
                                location: controllerLocation.text,
                                sureyedBy: controllerSurveydBy.text,
                                userType: outlet.userType!,
                                priceKg: controllerPrice.text,
                                payment: payment,
                                oilType: oilType,
                                quantity: quantity,
                                outletSpace: outletSpace,
                                date: controllerSurveydByDate.text,
                                id: outlet.outletId,
                                custPhone: controllerMobile1.text,
                                custRole: custRole ?? "",
                                workerName: controllerContactName2.text,
                                workerPhone: controllerMobile2.text,
                                workerRole: workerRole ?? "",
                                agreementName: controllerAgreementBy.text,
                                agreementDate: controllerAgreementByDate.text,
                                contract: "$contract",
                                endDate: controllerAgreementEndDate.text,
                                startDate: controllerAgreementStartDate.text,
                                approveDate: controllerApprovedByDate.text,
                                approveName: outlet.approveName!,
                                approvedBy: controllerApprovedBy.text,
                                notes: outlet.notes!,
                              );
                            }
                          },
                          child: Text(
                            AppStrings.submit.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                !.copyWith(
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
                          onPressed: () {},
                          child: Text(
                            AppStrings.cancel.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                !.copyWith(
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
    });
  }

  Widget item({
    required context,
    required TextEditingController controller,
    required TextInputType textInputType,
    required String label,
    suffixIcon,
    String? Function(String?)? validator,
    void Function()? onTap,
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
              suffixIcon: suffixIcon,
              onTap: onTap,
              validator: validator,
              enabled: enabled,
            ),
          ],
        ),
      );

  Widget itemDropDown({
    required BuildContext context,
    required List<String> list,
    required void Function(String?) onChange,
    required String title,
    required String hint,
    required String validateText,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height / AppSize.s100,
        horizontal: MediaQuery.of(context).size.width / AppSize.s30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s80,
          ),
          SharedWidget.dropDown(
            hintText: hint,
            list: list,
            validateText: validateText,
            onChanged: onChange,
            validator: validator,
          ),
        ],
      ),
    );
  }
}
