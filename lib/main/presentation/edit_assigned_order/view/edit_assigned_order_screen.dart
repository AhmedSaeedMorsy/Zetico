// ignore_for_file: must_be_immutable
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:zetico/app/common/widget.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../../models/assigned_order_model.dart';
import '../controller/edit_assigned_order_bloc.dart';
import '../controller/edit_assigned_order_states.dart';

class EditAssignedOrderScreen extends StatelessWidget {
  EditAssignedOrderScreen({
    super.key,
    required this.order,
  });
  AssignedModel order;
  String date = DateFormat.yMd().format(DateTime.now()).toString();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditAssignedOrderBloc()
        ..currentValue = int.parse(order.assignedQuantity!),
      child: BlocConsumer<EditAssignedOrderBloc, EditAssignedOrderStates>(
        listener: (context, state) {
          if (state is EditAssignedOrderSuccessState) {
            Navigator.pushReplacementNamed(
              context,
              Routes.homeRoute,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                AppStrings.editOrder.tr(),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    AppStrings.orderQtyKg.tr(),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
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
                    onChange: (int value) {
                      EditAssignedOrderBloc.get(context).changeNumberPicker(
                        value,
                      );
                    },
                    value: EditAssignedOrderBloc.get(context).currentValue,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s30,
                  ),
                  Text(
                    AppStrings.estimatedPrice.tr(),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: FontSizeManager.s22,
                        ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s50,
                  ),
                  Text(
                    "${EditAssignedOrderBloc.get(context).price(int.parse(order.priceKg!))}",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: FontSizeManager.s22,
                        ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s30,
                  ),
                  Text(
                    AppStrings.datewithout.tr(),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
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
                            EditAssignedOrderBloc.get(context)
                                .changeBottonBackground(0);
                          },
                          color: EditAssignedOrderBloc.get(context)
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
                            EditAssignedOrderBloc.get(context)
                                .changeBottonBackground(1);
                          },
                          color: EditAssignedOrderBloc.get(context)
                              .backgroundColorButtonTomorrow,
                        ),
                      ),
                      Expanded(
                        child: dateButton(
                          context: context,
                          text: EditAssignedOrderBloc.get(context).selectDate,
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
                                EditAssignedOrderBloc.get(context)
                                    .dateText(date);
                                EditAssignedOrderBloc.get(context)
                                    .changeBottonBackground(2);
                              },
                            );
                          },
                          color: EditAssignedOrderBloc.get(context)
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
                            EditAssignedOrderBloc.get(context)
                                .editAssignedOrder(
                              orderId: order.assignedOrderId!,
                              driverId: order.memberId!,
                              orderQty: EditAssignedOrderBloc.get(context)
                                  .currentValue
                                  .toString(),
                              orderDate: date,
                              userId: "1",
                            );
                          },
                          AppStrings.confirm.tr(),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / AppSize.s30,
                      ),
                      Expanded(
                        child: SharedWidget.defaultButton(
                          context,
                          () {
                            Navigator.pop(context);
                          },
                          AppStrings.cancel.tr(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
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
              fontSize: FontSizeManager.s16.sp, color: ColorManager.black),
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
}
