// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:zetico/app/common/widget.dart';
import 'package:zetico/main/presentation/manual_order/controller/manual_order_bloc.dart';
import 'package:zetico/main/presentation/manual_order/controller/manual_order_states.dart';
import 'package:zetico/main/presentation/outlet_home/controller/view_outlet_bloc.dart';
import 'package:zetico/main/presentation/outlet_home/controller/view_outlet_states.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../../models/view_outlet_models.dart';
import '../../driver_in_manual_order/view/driver_team_in_manual_order_screen.dart';

class ManualOrderView extends StatelessWidget {
  ManualOrderView({super.key});
  List<ResturantModel>? resturantList;
  double price = 0.0;
  final searchController = TextEditingController();
  String date = DateFormat.yMd().format(DateTime.now()).toString();
  String? orderQty;
  String? outletId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.manualOrder.tr(),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: FontSizeManager.s16.sp,
              ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / AppSize.s50,
          horizontal: MediaQuery.of(context).size.width / AppSize.s50,
        ),
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocConsumer<ManualOrderBloc, ManualOrderStates>(
              listener: (context, state) {
                if (state is AddOrderSuccessState) {
                  Navigator.pushReplacementNamed(
                    context,
                    Routes.homeRoute,
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    BlocBuilder<ViewOutletBloc, ViewOutletStates>(
                      builder: (context, state) {
                        return dropDownSearchList(
                          context: context,
                          onChange: (value) {
                            searchController.text = value!;
                            ManualOrderBloc.get(context)
                                .getPrice(outletName: searchController.text);
                          },
                          resturantList:
                              ViewOutletBloc.get(context).resturantAgreed,
                        );
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s50,
                    ),
                    Text(
                      AppStrings.orderQtyKg.tr(),
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: FontSizeManager.s26.sp,
                              ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s50,
                    ),
                    Center(
                      child: Icon(
                        Icons.arrow_downward,
                        color: ColorManager.primaryColor,
                        size: AppSize.s30.w,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s50,
                    ),
                    numberpicker(
                        context: context,
                        value: ManualOrderBloc.get(context).currentValue,
                        onChange: (value) {
                          ManualOrderBloc.get(context)
                              .changeNumberPicker(value);
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s30,
                    ),
                    Text(
                      AppStrings.estimatedPrice.tr(),
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: FontSizeManager.s22,
                              ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s50,
                    ),
                    Text(
                      "${ManualOrderBloc.get(context).priceOutlet}",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: FontSizeManager.s22,
                          ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s30,
                    ),
                    Text(
                      AppStrings.datewithout.tr(),
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: FontSizeManager.s22,
                              ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s50,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: dateButton(
                            context: context,
                            text: AppStrings.today.tr(),
                            onTap: () {
                              date = DateFormat.yMd()
                                  .format(DateTime.now())
                                  .toString();
                              ManualOrderBloc.get(context)
                                  .changeBottonBackground(0);
                            },
                            color: ManualOrderBloc.get(context)
                                .backgroundColorButtonToday,
                          ),
                        ),
                        Expanded(
                          child: dateButton(
                            context: context,
                            text: AppStrings.tomorrow.tr(),
                            onTap: () {
                              date = DateFormat.yMd()
                                  .format(DateTime.now().add(const Duration(
                                    days: 1,
                                  )))
                                  .toString();
                              ManualOrderBloc.get(context)
                                  .changeBottonBackground(1);
                            },
                            color: ManualOrderBloc.get(context)
                                .backgroundColorButtonTomorrow,
                          ),
                        ),
                        Expanded(
                          child: dateButton(
                            context: context,
                            text: ManualOrderBloc.get(context).selectDate,
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now().add(
                                  const Duration(
                                    days: 2,
                                  ),
                                ),
                                firstDate: DateTime.now().add(
                                  const Duration(
                                    days: 2,
                                  ),
                                ),
                                lastDate:
                                    DateTime.parse(AppStrings.calenderEndDate),
                              ).then(
                                (value) {
                                  date = DateFormat.yMd().format(value!);
                                  ManualOrderBloc.get(context).dateText(date);
                                  ManualOrderBloc.get(context)
                                      .changeBottonBackground(2);
                                },
                              );
                            },
                            color: ManualOrderBloc.get(context)
                                .backgroundColorButtonSelectDate,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SharedWidget.defaultButton(
                            context,
                            () {
                              orderQty =ManualOrderBloc.get(context)
                                        .currentValue
                                        .toString();
                                        outletId =ManualOrderBloc.get(context)
                                        .outletPriceModel
                                        .outlet[0]
                                        .outletId!;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DriverTeamInManualOrderScreen(
                                    orderDate: date,
                                    orderQty: orderQty!,
                                    outletId: outletId!,
                                  ),
                                ),
                              );
                            },
                            AppStrings.confirmAndAssign.tr(),
                          ),
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width / AppSize.s30,
                        ),
                        Expanded(
                          child: SharedWidget.defaultButton(
                            context,
                            () {
                              ManualOrderBloc.get(context).addNewOrder(
                                  outletId: ManualOrderBloc.get(context)
                                      .outletPriceModel
                                      .outlet[0]
                                      .outletId!,
                                  orderQty: ManualOrderBloc.get(context)
                                      .currentValue
                                      .toString(),
                                  orderDate: date,
                                  userId: "1");
                            },
                            AppStrings.confirm.tr(),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }

  Widget dateButton(
      {required String text,
      required BuildContext context,
      required void Function() onTap,
      required Color color}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / AppSize.s50,
          horizontal: MediaQuery.of(context).size.width / AppSize.s50,
        ),
        decoration: BoxDecoration(
          color: color,
          border: const Border(
            bottom: BorderSide(
              color: ColorManager.grey,
            ),
            right: BorderSide(
              color: ColorManager.grey,
            ),
            left: BorderSide(
              color: ColorManager.grey,
            ),
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: FontSizeManager.s18.sp, color: ColorManager.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget numberpicker({
    required BuildContext context,
    required int value,
    required void Function(int) onChange,
  }) =>
      NumberPicker(
        value: value,
        selectedTextStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: FontSizeManager.s26.sp,
            ),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.primaryColor,
          ),
        ),
        textStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontSize: FontSizeManager.s22.sp),
        axis: Axis.horizontal,
        minValue: 0,
        step: 10,
        maxValue: 2000,
        itemWidth: AppSize.s60.w,
        onChanged: onChange,
      );

  Widget dropDownSearchList({
    required BuildContext context,
    required void Function(String?) onChange,
    required List<ResturantModel> resturantList,
  }) =>
      Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppSize.s100.h,
            ),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / AppSize.s180,
              horizontal: MediaQuery.of(context).size.width / AppSize.s50,
            ),
            child: DropdownButton2(
              isExpanded: true,
              hint: Text(
                searchController.text,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              items: resturantList
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item.outletNameEn,
                      child: Text(
                        item.outletNameEn!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onChange,
              searchController: searchController,
              searchInnerWidget: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / AppSize.s180,
                  horizontal: MediaQuery.of(context).size.width / AppSize.s50,
                ),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: AppSize.s10.h,
                      horizontal: AppSize.s10.w,
                    ),
                    hintText: AppStrings.dropDownSearchHint.tr(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          AppSize.s100.h,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              searchMatchFn: (item, searchValue) {
                return (item.value.toString().contains(searchValue));
              },
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  searchController.clear();
                }
              },
            ),
          ),
        ),
      );
}
