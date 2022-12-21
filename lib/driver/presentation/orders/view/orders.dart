import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/app/services/shared_prefrences/cache_helper.dart';
import 'package:zetico/driver/presentation/orders/controller/order_bloc.dart';
import 'package:zetico/driver/presentation/orders/controller/order_states.dart';
import '../../../../app/common/widget.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../../model/order_model.dart';
import 'orders_details.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderBloc()
        ..getOrder(
          driverId:  CacheHelper.getData(
                  key: SharedKey.memberId,
                ),
        ),
      child: BlocBuilder<OrderBloc, OrderStates>(builder: (context, state) {
        return Column(
          children: [
            Expanded(
                child: ConditionalBuilderRec(
              condition: state is OrderSuccessState,
              builder: (context) {
                return itemBuilder(
                  OrderBloc.get(context).orderModel.orders,
                );
              },
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            )),
            SharedWidget.footer(context),
          ],
        );
      }),
    );
  }

  Widget itemBuilder(List<ItemModel> order) => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: order.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            showDialogOrder(context, order[index]);
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
                        order[index].addressDetail,
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s100,
                      ),
                      textItem(
                        context,
                        AppStrings.date.tr(),
                        order[index].assignedDate,
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
                        onPressed: () {
                          OrderBloc.get(context).openMap(location: order[index].location);
                        },
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
