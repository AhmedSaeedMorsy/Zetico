import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/main/presentation/assign_orders/controller/assigned_orders_bloc.dart';
import 'package:zetico/main/presentation/assign_orders/controller/assigned_orders_states.dart';
import '../../../../app/common/widget.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../../models/assigned_order_model.dart';
import 'assign_orders_dialog.dart';

class AssignOrdersView extends StatelessWidget {
  const AssignOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssignedOrdersBloc, AssignedOrdersStates>(
        builder: (context, state) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / AppSize.s180,
              horizontal: MediaQuery.of(context).size.width / AppSize.s50,
            ),
            child: SharedWidget.defaultTextFormField(
                hint: AppStrings.restaurant.tr(),
                textInputType: TextInputType.text,
                onFieldSubmitted: (value) {
                  // PurchasingBloc.get(context).searchPurchesing(value);
                }),
          ),
          Expanded(
            child: ConditionalBuilderRec(
              condition: state is AssignedOrdersSuccessState,
              builder: (context) => itemBuilder(
                AssignedOrdersBloc.get(context).assignedOrdersModel.orders,
              ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          SharedWidget.footer(context),
        ],
      );
    });
  }

  Widget itemBuilder(List<AssignedModel> order) => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: order.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            showAssignOrdersDialog(context, order[index]);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / AppSize.s50,
              horizontal: MediaQuery.of(context).size.height / AppSize.s50,
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
                        order[index].outletNameEn!,
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s100,
                      ),
                      textItem(
                        context,
                        AppStrings.estQt.tr(),
                        order[index].assignedQuantity!,
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s100,
                      ),
                      textItem(
                        context,
                        AppStrings.price.tr(),
                        order[index].priceKg!,
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s100,
                      ),
                      textItem(
                        context,
                        AppStrings.area.tr(),
                        order[index].areaEn!,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "${AppStrings.date.tr()} ${order[index].assignedDate}",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: FontSizeManager.s14.sp,
                          color: ColorManager.grey,
                        ),
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
