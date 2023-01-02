import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/common/widget.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import 'declined_order_dialog.dart';

class DeclinedOrderScreen extends StatelessWidget {
  const DeclinedOrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
            onFieldSubmitted: (String? value) {},
          ),
        ),
        Expanded(
          child: ConditionalBuilderRec(
            condition: true,
            builder: (context) => itemBuilder(),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        SharedWidget.footer(context),
      ],
    );
  }
}

Widget itemBuilder() => ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          showDeclinedOrderDialog(
            context,
          );
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
                      AppStrings.driverName.tr(),
                      AppStrings.driverName.tr(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s100,
                    ),
                    textItem(
                      context,
                      AppStrings.licence.tr(),
                      AppStrings.licence.tr(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s100,
                    ),
                    textItem(
                      context,
                      AppStrings.quantity.tr(),
                      AppStrings.quantity.tr(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s100,
                    ),
                    textItem(
                      context,
                      AppStrings.date.tr(),
                      AppStrings.date.tr(),
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
