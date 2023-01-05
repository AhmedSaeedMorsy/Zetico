import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/driver/presentation/order_on_progress/view/orders_on_progress.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../orders/view/orders.dart';

class OrdersHome extends StatelessWidget {
  const OrdersHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // actions: [
          //   Padding(
          //     padding: EdgeInsets.only(
          //       right: MediaQuery.of(context).size.width / AppSize.s180,
          //     ),
          //     child: IconButton(
          //       onPressed: () {},
          //       icon: Icon(
          //         Icons.notifications_sharp,
          //         size: AppSize.s30.w,
          //       ),
          //     ),
          //   ),
          // ],
      
          backgroundColor: ColorManager.thirdgradientColor,
          centerTitle: true,
          title: Text(
            AppStrings.orders.tr(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: FontSizeManager.s18.sp,
                ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: AppSize.s55.h,
              decoration: BoxDecoration(
                color: ColorManager.firstgradientColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    AppSize.s5.w,
                  ),
                  bottomRight: Radius.circular(
                    AppSize.s5.w,
                  ),
                ),
              ),
              child: TabBar(
                indicatorColor: ColorManager.black,
                indicator: const BoxDecoration(
                  color: ColorManager.white,
                ),
                labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: FontSizeManager.s14.sp,
                    ),
                labelColor: ColorManager.primaryColor,
                automaticIndicatorColorAdjustment: true,
                unselectedLabelColor: ColorManager.white,
                unselectedLabelStyle: const TextStyle(
                  color: ColorManager.white,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.orders.tr(),
                      ),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width / AppSize.s50,
                      // ),
                      // Container(
                      //   padding: EdgeInsets.all(
                      //     MediaQuery.of(context).size.width / AppSize.s80,
                      //   ),
                      //   clipBehavior: Clip.antiAliasWithSaveLayer,
                      //   decoration: BoxDecoration(
                      //     color: ColorManager.error,
                      //     shape: BoxShape.circle,
                      //   ),
                      //   child: Text(
                      //     AppStrings.three,
                      //     style:
                      //         Theme.of(context).textTheme.bodySmall!.copyWith(
                      //               fontSize: FontSizeManager.s14.sp,
                      //             ),
                      //   ),
                      // ),
                    
                    ],
                  ),
                  Text(
                    AppStrings.orderOnProgress.tr(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Orders(),
                  OrdersOnProgress(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
