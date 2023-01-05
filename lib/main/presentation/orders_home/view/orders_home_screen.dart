import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/app/resources/color_manager.dart';
import 'package:zetico/main/presentation/assign_orders/view/assign_orders_screen.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../collected_orders/view/collected_orders_screen.dart';
import '../../issued_orders/view/issued_orders_screen.dart';
import '../../new_orders/view/new_orders_screen.dart';
import '../../on_progress_orders/view/on_progress_orders_screen.dart';

class OrdersHomeScreen extends StatelessWidget {
  const OrdersHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
            AppStrings.order.tr(),
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: FontSizeManager.s16.sp),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: AppSize.s70.h,
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
                  vertical: MediaQuery.of(context).size.height / AppSize.s80,
                  horizontal: MediaQuery.of(context).size.width / AppSize.s50,
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
                    AppStrings.assignOrders.tr(),
                  ),
                  Text(
                    AppStrings.onProgressOrders.tr(),
                  ),
                  Text(
                    AppStrings.collectedOrders.tr(),
                  ),
                  Text(
                    AppStrings.issuedOrders.tr(),
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
                  NewOrdersScreen(),
                  AssignOrdersScreen(),
                  OnProgressOrdersScreen(),
                  CollectedOrdersScreen(),
                  IssuedOrdersScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
