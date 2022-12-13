import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/driver/presentation/completed_order/controller/completed_order_bloc.dart';
import '../../../../app/common/widget.dart';
import '../../../../app/resources/assets_manager.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../../model/collected_order_model.dart';
import '../controller/completed_order_states.dart';
import 'completed_orders_details.dart';

class CompletedOrders extends StatelessWidget {
  const CompletedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width / AppSize.s180,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    const Image(
                      image: AssetImage(
                        AssetsManager.notification,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width / AppSize.s150,
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color: ColorManager.error,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        AppStrings.three,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: FontSizeManager.s12.sp,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          backgroundColor: ColorManager.thirdgradientColor,
          centerTitle: true,
          title: Text(
            AppStrings.completedOrders.tr(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: FontSizeManager.s18.sp,
                ),
          ),
        ),
        body: BlocProvider(
            create: (context) =>
                CompletedOrderBloc()..getCompletedOrder(driverId: "4"),
            child: BlocBuilder<CompletedOrderBloc, CompletedOrderStates>(
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                        child: ConditionalBuilderRec(
                      condition: state is CompletedOrderSuccessState,
                      builder: (context) {
                        return itemBuilder(
                          CompletedOrderBloc.get(context)
                              .completedorderModel
                              .orders,
                        );
                      },
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )),
                    SharedWidget.footer(context),
                  ],
                );
              },
            )));
  }

  Widget itemBuilder(List<CompletedModel> order) => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: order.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            showDialogCompletedOrder(context, order[index]);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / AppSize.s50,
              horizontal: MediaQuery.of(context).size.width / AppSize.s50,
            ),
            child: Row(
              children: [
                SharedWidget.circleContainer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width / AppSize.s50,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textItem(
                        context,
                        AppStrings.outletName.tr(),
                        order[index].outletNameAr,
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s100,
                      ),
                      textItem(
                        context,
                        AppStrings.area.tr(),
                        order[index].areaEn,
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s100,
                      ),
                      textItem(
                        context,
                        AppStrings.phone.tr(),
                        order[index].phone,
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s100,
                      ),
                      textItem(
                        context,
                        AppStrings.address.tr(),
                        order[index].phone,
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s100,
                      ),
                      textItem(
                        context,
                        AppStrings.date.tr(),
                        order[index].assignDate,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text(
                        "30 kg",
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  fontSize: FontSizeManager.s14.sp,
                                  color: ColorManager.grey,
                                ),
                      ),
                      Text(
                        "30 kg",
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  fontSize: FontSizeManager.s14.sp,
                                  color: ColorManager.grey,
                                ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.location_on_outlined,
                          color: ColorManager.primaryColor,
                          size: AppSize.s18.w,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget textItem(BuildContext context, String textHead, String textBody) =>
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: textHead,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: FontSizeManager.s14.sp,
                  ),
            ),
            TextSpan(
              text: textBody,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: FontSizeManager.s12.sp,
                    color: ColorManager.grey,
                  ),
            ),
          ],
        ),
      );
}
