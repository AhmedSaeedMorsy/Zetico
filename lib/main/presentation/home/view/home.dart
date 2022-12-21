import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/app/common/widget.dart';
import 'package:zetico/app/resources/assets_manager.dart';
import 'package:zetico/app/resources/color_manager.dart';
import 'package:zetico/app/resources/font_manager.dart';
import 'package:zetico/app/resources/strings_manager.dart';
import 'package:zetico/app/services/shared_prefrences/cache_helper.dart';
import 'package:zetico/main/main_controller/main_bloc.dart';
import 'package:zetico/main/main_controller/main_states.dart';
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
        ..getLongitudeAndLatitude()
        ..getRoles(
          userId: CacheHelper.getData(
            key: SharedKey.memberId,
          ),
        ),
      child: BlocConsumer<MainBloc, MainStates>(
        listener: (context, state) {
          if (state is RolesSuccessState) {
            CacheHelper.setData(
              key: SharedKey.roleCreate,
              value: MainBloc.get(context).rolesModel.roles[0].roleCreate,
            );
            CacheHelper.setData(
              key: SharedKey.roleDelete,
              value: MainBloc.get(context).rolesModel.roles[0].roleDelete,
            );
            CacheHelper.setData(
              key: SharedKey.roleEdit,
              value: MainBloc.get(context).rolesModel.roles[0].roleEdit,
            );
            CacheHelper.setData(
              key: SharedKey.roleSpecial,
              value: MainBloc.get(context).rolesModel.roles[0].roleSpecial,
            );
          }
        },
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
            drawer: SharedWidget.drawer(
              context: context,
              name: CacheHelper.getData(
                key: SharedKey.memberName,
              ),
              phone: CacheHelper.getData(
                key: SharedKey.memberPhone,
              ),
            ),
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
                        Expanded(
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
                        Expanded(
                          child: bodyItem(
                            context: context,
                            function: () {},
                            image: AssetsManager.registeredOutlet,
                            text: AppStrings.onlineRegOutlet.tr(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: bodyItem(
                            context: context,
                            function: () {
                              if (CacheHelper.getData(
                                key: SharedKey.roleCreate,
                              ).toString().contains("order")) {
                                Navigator.pushNamed(
                                  context,
                                  Routes.manualOrderRoute,
                                );
                              } else {
                                SharedWidget.toast(
                                  backgroundColor: ColorManager.yellow,
                                  message:
                                      AppStrings.permissionStringWarning.tr(),
                                );
                              }
                            },
                            image: AssetsManager.manualOrder,
                            text: AppStrings.manualOrder.tr(),
                          ),
                        ),
                        Expanded(
                          child: bodyItem(
                            context: context,
                            function: () {
                              if (CacheHelper.getData(
                                key: SharedKey.roleCreate,
                              ).toString().contains("order")) {
                                Navigator.pushNamed(
                                  context,
                                  Routes.ordersHomeRoute,
                                );
                              } else {
                                SharedWidget.toast(
                                  backgroundColor: ColorManager.yellow,
                                  message:
                                      AppStrings.permissionStringWarning.tr(),
                                );
                              }
                            },
                            image: AssetsManager.orders,
                            text: AppStrings.orders.tr(),
                          ),
                        ),
                        Expanded(
                          child: bodyItem(
                            context: context,
                            function: () {
                              if (CacheHelper.getData(key: SharedKey.roleCreate)
                                  .toString()
                                  .contains("outlet")) {
                                Navigator.pushNamed(
                                  context,
                                  Routes.addOutletRoute,
                                );
                              } else {
                                SharedWidget.toast(
                                    backgroundColor: ColorManager.yellow,
                                    message: AppStrings.permissionStringWarning
                                        .tr());
                              }
                            },
                            image: AssetsManager.addOutlet,
                            text: AppStrings.addOutlet.tr(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: bodyItem(
                            context: context,
                            function: () {
                              Navigator.pushNamed(
                                context,
                                Routes.viewOutletRoute,
                              );
                            },
                            image: AssetsManager.survyedOutlet,
                            text: AppStrings.viewOutlet.tr(),
                          ),
                        ),
                        Expanded(
                          child: bodyItem(
                            context: context,
                            function: () {},
                            image: AssetsManager.warehouse,
                            text: AppStrings.warehouse.tr(),
                          ),
                        ),
                        Expanded(
                          child: bodyItem(
                            context: context,
                            function: () {
                              if (CacheHelper.getData(
                                key: SharedKey.roleSpecial,
                              ).toString().contains("reassignDecline")) {
                                Navigator.pushNamed(
                                  context,
                                  Routes.declinedOutletRoute,
                                );
                              } else {
                                SharedWidget.toast(
                                    backgroundColor: ColorManager.yellow,
                                    message: AppStrings.permissionStringWarning
                                        .tr());
                              }
                            },
                            image: AssetsManager.survyedOutlet,
                            text: AppStrings.declinedOutlet.tr(),
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
}
