// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/app/common/widget.dart';
import 'package:zetico/app/resources/strings_manager.dart';
import 'package:zetico/app/resources/values_manager.dart';
import 'package:zetico/main/presentation/purchasing_team/controller/purchasing_team_bloc.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../models/purchasing_team_model.dart';
import '../../../models/verfied_model.dart';
import '../controller/purchasing_team_states.dart';

class PurchasingTeamScreen extends StatelessWidget {
  PurchasingTeamScreen({super.key, required this.outlet});
  VerfiedResturantOutletModel outlet;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PurchasingTeamBloc()..getPurchasingTeam(),
      child: BlocConsumer<PurchasingTeamBloc, PurchasingTeamStates>(
          listener: (context, state) {
        if (state is AssignPurchaserMemberSuccessState) {
          Navigator.pushReplacementNamed(
            context,
            Routes.homeRoute,
          );
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.purchasingTeam.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: FontSizeManager.s16.sp),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical:
                          MediaQuery.of(context).size.height / AppSize.s30,
                      horizontal:
                          MediaQuery.of(context).size.width / AppSize.s20),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return itemBuilder(
                        context: context,
                        onPressed: () {
                          PurchasingTeamBloc.get(context).assignPurchaserMember(
                            outletId: outlet.outletId,
                            teamMemberId: PurchasingTeamBloc.get(context)
                                .purchasingTeamModel
                                .team[index]
                                .memberId,
                          );
                        },
                        model: PurchasingTeamBloc.get(context)
                            .purchasingTeamModel
                            .team[index],
                      );
                    },
                    separatorBuilder: (context, state) {
                      return SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s30,
                      );
                    },
                    itemCount: PurchasingTeamBloc.get(context)
                        .purchasingTeamModel
                        .team
                        .length,
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
    required PurchasingMemberModel model,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.memberName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                model.memberPhone,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
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
