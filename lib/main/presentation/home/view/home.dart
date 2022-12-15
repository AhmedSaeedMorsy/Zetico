import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/app/resources/assets_manager.dart';
import 'package:zetico/app/resources/color_manager.dart';
import 'package:zetico/app/resources/font_manager.dart';
import 'package:zetico/app/resources/strings_manager.dart';
import 'package:zetico/app/services/shared_prefrences/cache_helper.dart';
import 'package:zetico/main/main_controller/main_bloc.dart';
import 'package:zetico/main/main_controller/main_states.dart';
import '../../../../app/resources/language_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/values_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc()
        ..getCity()
        ..getCurrentPosition()
        ..getLongitudeAndLatitude(),
      child: BlocBuilder<MainBloc, MainStates>(
        builder: (context, state) {
          return Scaffold(
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
            drawer: drawer(context),
            body: Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / AppSize.s50,
                horizontal: MediaQuery.of(context).size.width / AppSize.s30,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: bodyItem(
                              function: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.surveyedHomeRoute,
                                );
                              },
                              text: AppStrings.surveyedOutlet.tr(),
                              image: AssetsManager.survyedOutlet,
                              context: context,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: bodyItem(
                              context: context,
                              function: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.purchasedHomeRoute,
                                );
                              },
                              image: AssetsManager.purchased,
                              text: AppStrings.purchased.tr(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: bodyItem(
                              context: context,
                              function: () {},
                              image: AssetsManager.registeredOutlet,
                              text: AppStrings.onlineRegOutlet.tr(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: bodyItem(
                              context: context,
                              function: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.manualOrderRoute,
                                );
                              },
                              image: AssetsManager.manualOrder,
                              text: AppStrings.manualOrder.tr(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: bodyItem(
                              context: context,
                              function: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.ordersHomeRoute,
                                );
                              },
                              image: AssetsManager.orders,
                              text: AppStrings.orders.tr(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: bodyItem(
                              context: context,
                              function: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.addOutletRoute,
                                );
                              },
                              image: AssetsManager.addOutlet,
                              text: AppStrings.addOutlet.tr(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: bodyItem(
                              context: context,
                              function: () {
                                Navigator.pushNamed(
                                    context, Routes.viewOutletRoute);
                              },
                              image: AssetsManager.survyedOutlet,
                              text: AppStrings.viewOutlet.tr(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: bodyItem(
                              context: context,
                              function: () {},
                              image: AssetsManager.warehouse,
                              text: AppStrings.warehouse.tr(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: bodyItem(
                              context: context,
                              function: () {
                                Navigator.pushNamed(
                                    context, Routes.declinedOutletRoute);
                              },
                              image: AssetsManager.survyedOutlet,
                              text: AppStrings.declinedOutlet.tr(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget bodyItem({
    required BuildContext context,
    required String text,
    required String image,
    required void Function() function,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / AppSize.s120,
        ),
        child: InkWell(
          onTap: function,
          child: Column(
            children: [
              Image.asset(
                image,
                width: AppSize.s70.w,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s60,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorManager.black,
                      fontSize: FontSizeManager.s14.sp,
                    ),
              ),
            ],
          ),
        ),
      );

  Widget drawer(context) => Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration:
                  const BoxDecoration(color: ColorManager.thirdgradientColor),
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.height / AppSize.s50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppStrings.name.tr(),
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: FontSizeManager.s18.sp,
                        ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s80,
                  ),
                  Text(
                    AppStrings.phone.tr(),
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: FontSizeManager.s18.sp,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s22,
            ),
            ListTile(
              leading: Image.asset(
                AssetsManager.settings,
              ),
              title: Text(
                AppStrings.language.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () {
                changeLanguage(context);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s22,
            ),
            ListTile(
              leading: Image.asset(
                AssetsManager.settings,
              ),
              title: Text(
                AppStrings.editProfile.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s22,
            ),
            ListTile(
              leading: Image.asset(
                AssetsManager.logOut,
              ),
              title: Text(
                AppStrings.logOut.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () {
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
            ),
          ],
        ),
      );
  void changeLanguage(context) {
    changeAppLanguage();
    Phoenix.rebirth(context);
  }
}
