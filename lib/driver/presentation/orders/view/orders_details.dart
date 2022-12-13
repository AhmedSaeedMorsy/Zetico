import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/driver/presentation/orders/controller/order_bloc.dart';
import 'package:zetico/driver/presentation/orders/controller/order_states.dart';

import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../../model/order_model.dart';

Future showDialogOrder(BuildContext context, ItemModel order) => showDialog(
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height / AppSize.s50,
          ),
          color: ColorManager.lightGrey,
        ),
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / AppSize.s10,
          horizontal: MediaQuery.of(context).size.height / AppSize.s20,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / AppSize.s20,
            horizontal: MediaQuery.of(context).size.width / AppSize.s30,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    AppStrings.orderDetails.tr(),
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: FontSizeManager.s16.sp,
                        ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s30,
                ),
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
                  AppStrings.name.tr(),
                  order.outletNameAr,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.location.tr(),
                  order.location,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.city.tr(),
                  order.cityEn,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.area.tr(),
                  order.areaEn,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s30,
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
                  AppStrings.orderQt.tr(),
                  order.assignedQuantity,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.price.tr(),
                  order.totalPrice,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s30,
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
                  order.custName,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.phone.tr(),
                  order.phone,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s22,
                ),
                BlocProvider(
                  create: (context) => OrderBloc(),
                  child: BlocConsumer<OrderBloc, OrderStates>(
                    listener: (context, state) {
                      if (state is OrderToProgressSuccessState) {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.homeDriverRoute,
                          );
                      }
                    },
                    builder: (context, state) {
                      return Center(
                        child: Container(
                          height: AppSize.s40.h,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height / AppSize.s100,
                            ),
                            border: Border.all(
                              color: ColorManager.primaryColor,
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              OrderBloc.get(context).postOrderToOnProgress(
                                orderId: order.assignedOrderId,
                              );
                            },
                            child: Text(
                              AppStrings.acceptOrder.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: FontSizeManager.s14.sp,
                                  ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
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
            fontSize: FontSizeManager.s12.sp,
          ),
    );
Widget driver() => Container(
      height: AppSize.s1.h,
      width: double.infinity,
      color: ColorManager.primaryColor,
    );

Widget bodyText(BuildContext context, String text, String bodyText) => Text(
      "$text $bodyText",
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
            fontSize: FontSizeManager.s12.sp,
            color: ColorManager.grey,
          ),
    );
