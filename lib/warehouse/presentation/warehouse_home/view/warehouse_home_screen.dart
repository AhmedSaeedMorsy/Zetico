import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/app/resources/color_manager.dart';
import 'package:zetico/warehouse/presentation/collected_order/view/collected_order_screen.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../declined_order/view/declined_order_screen.dart';
import '../../history_order/view/history_order_screen.dart';
import '../../new_order/view/new_order_screen.dart';

class WarehouseHomeScreen extends StatelessWidget {
  const WarehouseHomeScreen({super.key});
  @override 
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          // actions: [
          //   IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.notifications_sharp,
          //       size: AppSize.s30.w,
          //     ),
          //   ),
          // ],
          backgroundColor: ColorManager.thirdgradientColor,
          centerTitle: true,
          title: Text(
            AppStrings.warehouse.tr(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: FontSizeManager.s16.sp,
                ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: AppSize.s60.h,
              decoration: BoxDecoration(
                color: ColorManager.firstgradientColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    AppSize.s8.h,
                  ),
                  bottomRight: Radius.circular(
                    AppSize.s8.h,
                  ),
                ),
              ),
              child: TabBar(
                indicatorColor: ColorManager.black,
                indicator: const BoxDecoration(
                  color: ColorManager.white,
                ),
                labelStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: FontSizeManager.s12.sp,
                    ),
                labelPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / AppSize.s50,
                  horizontal: MediaQuery.of(context).size.width / AppSize.s30,
                ),
                labelColor: ColorManager.black,
                automaticIndicatorColorAdjustment: true,
                unselectedLabelColor: ColorManager.white,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Text(
                    AppStrings.newOrders.tr(),
                  ),
                  Text(
                    AppStrings.collectedOrders.tr(),
                  ),
                  Text(
                    AppStrings.historyOrder.tr(),
                  ),
                  Text(
                    AppStrings.declinedOrder.tr(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s30,
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  NewOrderScreen(),
                  CollectedOrderScreen(),
                  OrderHistoryScreen(),
                  DeclinedOrderScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
