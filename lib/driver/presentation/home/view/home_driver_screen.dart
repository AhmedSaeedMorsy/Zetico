import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/app/services/shared_prefrences/cache_helper.dart';
import 'package:zetico/driver/presentation/home/controller/home_bloc.dart';
import 'package:zetico/driver/presentation/home/controller/home_states.dart';
import 'package:zetico/login_screen/controller/login_bloc.dart';

import '../../../../app/common/widget.dart';
import '../../../../app/resources/assets_manager.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';

class HomeDriverScreen extends StatelessWidget {
  const HomeDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc()
        ..getCurrentPosition()
        ..getLongitudeAndLatitude(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_sharp,
                size: AppSize.s30.w,
              ),
            ),
          ],
          backgroundColor: ColorManager.thirdgradientColor,
          centerTitle: true,
          title: Text(
            AppStrings.home.tr(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: FontSizeManager.s16.sp,
                ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              bodyItem(context),
              SharedWidget.footer(context),
            ],
          ),
        ),
        drawer: SharedWidget.drawer(
          context: context,
          name: CacheHelper.getData(
            key: SharedKey.memberName,
          ),
          phone: CacheHelper.getData(
            key: SharedKey.memberPhone,
          ),
        ),
      ),
    );
  }

  Widget bodyItem(BuildContext context) => BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeStates>(
        builder: (context, state) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height / AppSize.s12,
                vertical: MediaQuery.of(context).size.height / AppSize.s20,
              ),
              child: Column(
                children: [
                  chekInOutItem(
                    context: context,
                    memberLocation:
                        "${LoginBloc.get(context).latitude} ,${LoginBloc.get(context).longitude} ",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s10,
                  ),
                  ConditionalBuilderRec(
                    condition: CacheHelper.getData(key: SharedKey.checkIn) == true,
                    builder: (context) => Expanded(
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
                                      // number of notification
                                      // Container(
                                      //   padding: EdgeInsets.all(
                                      //     MediaQuery.of(context).size.width /
                                      //         AppSize.s100,
                                      //   ),
                                      //   clipBehavior: Clip.antiAliasWithSaveLayer,
                                      //   decoration: BoxDecoration(
                                      //     color: ColorManager.error,
                                      //     shape: BoxShape.circle,
                                      //   ),
                                      //   child: Text(
                                      //     AppStrings.three,
                                      //     style: Theme.of(context)
                                      //         .textTheme
                                      //         .bodySmall!
                                      //         .copyWith(
                                      //           fontSize: FontSizeManager.s16.sp,
                                      //         ),
                                      //   ),
                                      // ),
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
                    fallback: (context) => Center(
                      child: Text(
                        AppStrings.checkInString.tr(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ));
  Widget chekInOutItem({
    required BuildContext context,
    required String memberLocation,
  }) =>
      Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                HomeBloc.get(context).checkIn(
                  userId: CacheHelper.getData(
                    key: SharedKey.memberId,
                  ),
                  memberLocation: memberLocation,
                );
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
                HomeBloc.get(context).checkOut(
                  userId: CacheHelper.getData(
                    key: SharedKey.memberId,
                  ),
                  memberLocation: memberLocation,
                );
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
