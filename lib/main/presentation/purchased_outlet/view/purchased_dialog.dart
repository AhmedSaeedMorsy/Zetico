import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/main/presentation/purchased_outlet/controller/purchsed_bloc.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../../models/purchsed_model.dart';
import '../../aprove_purchased/view/approve_purchased_screen.dart';
import '../controller/purchsed_states.dart';

Future showPurchasedDialog(
        BuildContext context, PurchsedResturantOutletModel outlet) =>
    showDialog(
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height / AppSize.s50,
          ),
          color: ColorManager.lightGrey,
        ),
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / AppSize.s20,
          horizontal: MediaQuery.of(context).size.width / AppSize.s50,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / AppSize.s50,
            horizontal: MediaQuery.of(context).size.width / AppSize.s30,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headText(
                  context,
                  AppStrings.outletDetails.tr(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s80,
                ),
                driver(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.outletNameEn.tr(),
                  outlet.outletNameEn!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.outletNameAr.tr(),
                  outlet.outletNameAr!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.city.tr(),
                  outlet.cityEn!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.area.tr(),
                  outlet.areaEn!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.phone.tr(),
                  outlet.phone!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.address.tr(),
                  outlet.addressDetail!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.location.tr(),
                  outlet.location!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                headText(
                  context,
                  AppStrings.contactDetails.tr(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s80,
                ),
                driver(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.contactName.tr(),
                  outlet.custName!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.mobile.tr(),
                  outlet.custPhone!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.title.tr(),
                  outlet.custRole!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                headText(
                  context,
                  AppStrings.secondContactDetails.tr(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s80,
                ),
                driver(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.contactName.tr(),
                  outlet.workerName!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.mobile.tr(),
                  outlet.workerPhone!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.title.tr(),
                  outlet.workerRole!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                headText(
                  context,
                  AppStrings.orderOutletHistory.tr(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s80,
                ),
                driver(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.totalCollected.tr(),
                  outlet.totalCollected!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.lastCollectionDate.tr(),
                  outlet.lastCollection!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                headText(
                  context,
                  AppStrings.agreementDetails.tr(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s80,
                ),
                driver(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.purchasedBy.tr(),
                  outlet.approveName!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.agreementBy.tr(),
                  outlet.agreementName!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.agreementStartDate.tr(),
                  outlet.startDate!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.agreementEndDate.tr(),
                  outlet.endDate!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.pricePerKg.tr(),
                  outlet.priceKg!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.paymentMethod.tr(),
                  outlet.payment!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.oilType.tr(),
                  outlet.oilType!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.estimatedQt.tr(),
                  outlet.quantity!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                bodyText(
                  context,
                  AppStrings.spaceOutlet.tr(),
                  outlet.outletSpace!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                BlocProvider(
                    create: (context) => PurchsedBloc(),
                    child: BlocConsumer<PurchsedBloc, PurchsedStates>(
                      listener: (context, state) {
                        if (state is PurchsedNotAgreedSuccessState ||
                            state is PurchsedDeclinedSuccessState) {
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.homeRoute,
                          );
                        }
                      },
                      builder: (context, state) => Row(
                        children: [
                          button(
                            context,
                            AppStrings.approve.tr(),
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ApprovePurchasrdScreen(outlet: outlet,)),
                              );
                            },
                          ),
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width / AppSize.s50,
                          ),
                          button(
                            context,
                            AppStrings.notAgreed.tr(),
                            () {
                              PurchsedBloc.get(context).notAgreedPurchased(
                                outletId: outlet.outletId,
                              );
                            },
                          ),
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width / AppSize.s50,
                          ),
                          button(
                            context,
                            AppStrings.declined.tr(),
                            () {
                              PurchsedBloc.get(context).declinedPurchased(
                                outletId: outlet.outletId,
                              );
                            },
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );

Widget headText(BuildContext context, String text) => Text(
      text,
      style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontSize: FontSizeManager.s16.sp,
          ),
    );
Widget driver() => Container(
      height: AppSize.s1.h,
      width: double.infinity,
      color: ColorManager.primaryColor,
    );

Widget bodyText(BuildContext context, String text, String bodyText) => Text(
      "$text  $bodyText",
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
            fontSize: FontSizeManager.s12.sp,
            color: ColorManager.grey,
          ),
    );
Widget button(context, String text, void Function() onPressed) => Expanded(
      child: Container(
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
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: FontSizeManager.s12.sp,
                ),
          ),
        ),
      ),
    );
