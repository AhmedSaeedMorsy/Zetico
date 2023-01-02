import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/app/resources/routes_manager.dart';
import '../../../../app/common/widget.dart';
import '../../../../app/resources/assets_manager.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';

class HomeWarehouseScreen extends StatelessWidget {
  const HomeWarehouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_sharp,
              size: AppSize.s20.w,
            ),
          ),
          SizedBox(
            width: AppSize.s10.w,
          )
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
        name: AppStrings.name,
        phone: AppStrings.phone,
      ),
    );
  }

  Widget bodyItem(BuildContext context) => Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height / AppSize.s12,
            vertical: MediaQuery.of(context).size.height / AppSize.s20,
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.warehouse,
                          );
                        },
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Image(
                                  width: AppSize.s60.w,
                                  image: const AssetImage(
                                    AssetsManager.warehouse,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppSize.s12.h,
                            ),
                            Expanded(
                              child: Text(
                                AppStrings.warehouse.tr(),
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
                        onTap: () {},
                        child: Column(
                          children: [
                            Image(
                              width: AppSize.s50.w,
                              image: const AssetImage(
                                AssetsManager.completedOrder,
                              ),
                            ),
                            SizedBox(
                              height: AppSize.s12.h,
                            ),
                            Expanded(
                              child: Text(
                                AppStrings.shipping.tr(),
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
}
