// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/app/common/widget.dart';
import 'package:zetico/app/resources/strings_manager.dart';
import 'package:zetico/app/resources/values_manager.dart';
import 'package:zetico/main/models/new_orders_model.dart';
import 'package:zetico/main/presentation/driver_team/controller/driver_team_bloc.dart';
import 'package:zetico/main/presentation/driver_team/controller/driver_team_states.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/services/shared_prefrences/cache_helper.dart';
import '../../../models/driver_team_model.dart';

class DriverTeamScreen extends StatelessWidget {
  DriverTeamScreen({
    super.key,
    required this.order,
  });
  OrderModel order;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DriverTeamBloc()..getDriverTeam(),
      child: BlocConsumer<DriverTeamBloc, DriverTeamStates>(
          listener: (context, state) {
        if (state is AssignDriverMemberSuccessState) {
          Navigator.pushReplacementNamed(
            context,
            Routes.homeRoute,
          );
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.driverTeam.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: FontSizeManager.s14.sp),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / AppSize.s30,
                    horizontal: MediaQuery.of(context).size.width / AppSize.s20,
                  ),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return itemBuilder(
                        context: context,
                        driver: DriverTeamBloc.get(context)
                            .driverTeamModel
                            .team[index],
                        onPressed: () {
                          DriverTeamBloc.get(context).assignDriverMember(
                            orderId: order.orderId!,
                            driverId: DriverTeamBloc.get(context)
                                .driverTeamModel
                                .team[index]
                                .memberId,
                            userId: CacheHelper.getData(
                              key: SharedKey.memberId,
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, state) {
                      return SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s30,
                      );
                    },
                    itemCount:
                        DriverTeamBloc.get(context).driverTeamModel.team.length,
                  ),
                ),
              ),
              SharedWidget.footer(context),
            ],
          ),
        );
      }),
    );
  }

  Widget itemBuilder({
    required BuildContext context,
    required void Function() onPressed,
    required DriverModel driver,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  driver.memberName,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  driver.memberPhone,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          const Text(
            "30 kg",
            style: TextStyle(color: ColorManager.black),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / AppSize.s20,
          ),
          Container(
            height: AppSize.s40.h,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: ColorManager.primaryColor,
              borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.height / AppSize.s100,
              ),
            ),
            child: MaterialButton(
              onPressed: onPressed,
              child: Text(
                AppStrings.assign.tr(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: FontSizeManager.s12.sp,
                    ),
              ),
            ),
          ),
        ],
      );
}
