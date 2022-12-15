import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/common/widget.dart';
import '../../../../app/resources/assets_manager.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../../../app/services/shared_prefrences/cache_helper.dart';

class HomeDriverScreen extends StatelessWidget {
  const HomeDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            headerItem(context),
            bodyItem(context),
            SharedWidget.footer(context),
          ],
        ),
      ),
    );
  }

  Widget headerItem(BuildContext context) => Container(
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
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height / AppSize.s50,
            vertical: MediaQuery.of(context).size.width / AppSize.s40,
          ),
          child: Row(
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: AppSize.s60.w,
                height: AppSize.s60.h,
                decoration: BoxDecoration(
                  color: ColorManager.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorManager.white,
                  ),
                ),
                child: const Text(""),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / AppSize.s30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.name.tr(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: FontSizeManager.s14.sp,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      AppStrings.phone.tr(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: FontSizeManager.s14.sp,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      AppStrings.email,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: FontSizeManager.s14.sp,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(onTap: (){
                   CacheHelper.removeData(
                  key: SharedKey.role,
                );
                CacheHelper.removeData(
                  key: SharedKey.token,
                );
                Navigator.pushReplacementNamed(
                  context,
                  Routes.loginRoute,
                );
                },
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image(
                        width: AppSize.s20.w,
                        image: const AssetImage(
                          AssetsManager.notification,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width / AppSize.s100,
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: ColorManager.error,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          AppStrings.three,
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontSize: FontSizeManager.s14.sp,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget bodyItem(BuildContext context) => Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height / AppSize.s12,
            vertical: MediaQuery.of(context).size.height / AppSize.s20,
          ),
          child: Column(
            children: [
              chekInOutItem(context),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.ordersRoute,
                          );
                        },
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Image(
                                  width: AppSize.s90.w,
                                  image: const AssetImage(
                                    AssetsManager.orders,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.width /
                                        AppSize.s100,
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    color: ColorManager.error,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    AppStrings.three,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontSize: FontSizeManager.s16.sp,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppSize.s12.h,
                            ),
                            Expanded(
                              child: Text(
                                AppStrings.orders.tr(),
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: FontSizeManager.s18.sp,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppSize.s30.w,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.completedOrdersRoute,
                          );
                        },
                        child: Column(
                          children: [
                            Image(
                              width: AppSize.s60.w,
                              image: const AssetImage(
                                AssetsManager.completedOrder,
                              ),
                            ),
                            SizedBox(
                              height: AppSize.s12.h,
                            ),
                            Expanded(
                              child: Text(
                                AppStrings.completedOrders.tr(),
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: FontSizeManager.s18.sp,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  Widget chekInOutItem(BuildContext context) => Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                // To Do function to Check in
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  border: Border.all(
                    color: ColorManager.primaryColor,
                  ),
                ),
                height: AppSize.s50.h,
                child: Center(
                  child: Text(
                    AppStrings.checkIn.tr(),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: FontSizeManager.s18.sp,
                        ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                // To Do function to Check in
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorManager.primaryColor,
                ),
                height: AppSize.s50.h,
                child: Center(
                  child: Text(
                    AppStrings.checkOut.tr(),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: ColorManager.white,
                          fontSize: FontSizeManager.s18.sp,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
