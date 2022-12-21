import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/main/presentation/declined_outlet/controller/declined_bloc.dart';
import 'package:zetico/main/presentation/declined_outlet/controller/declined_states.dart';
import '../../../../app/common/widget.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import 'declined_dialog.dart';

class DeclinedOutletScreen extends StatelessWidget {
  DeclinedOutletScreen({super.key});
  final controllerSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeclinedBloc()..getDeclined(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.declinedOutlet.tr(),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / AppSize.s40,
                horizontal: MediaQuery.of(context).size.width / AppSize.s50,
              ),
              child: SharedWidget.defaultTextFormField(
                controller: controllerSearch,
                hint: AppStrings.restaurant.tr(),
                textInputType: TextInputType.text,
              ),
            ),
            BlocBuilder<DeclinedBloc, DeclinedStates>(
              builder: (context, state) => Expanded(
                child: ConditionalBuilderRec(
                  condition: state is DeclinedSuccessState,
                  builder: (context) => itemBuilder(),
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
            SharedWidget.footer(context),
          ],
        ),
      ),
    );
  }

  Widget itemBuilder() => BlocBuilder<DeclinedBloc, DeclinedStates>(
        builder: (context, state) => ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: DeclinedBloc.get(context).declinedModel.resturant.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              showDeclinedDialog(context,
                  DeclinedBloc.get(context).declinedModel.resturant[index]);
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
                          DeclinedBloc.get(context)
                              .declinedModel
                              .resturant[index]
                              .outletNameEn!,
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height / AppSize.s100,
                        ),
                        textItem(
                          context,
                          AppStrings.estQt.tr(),
                          DeclinedBloc.get(context)
                              .declinedModel
                              .resturant[index]
                              .quantity!,
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height / AppSize.s100,
                        ),
                        textItem(
                          context,
                          AppStrings.price.tr(),
                          DeclinedBloc.get(context)
                              .declinedModel
                              .resturant[index]
                              .priceKg!,
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height / AppSize.s100,
                        ),
                        textItem(
                          context,
                          AppStrings.area.tr(),
                          DeclinedBloc.get(context)
                              .declinedModel
                              .resturant[index]
                              .areaEn!,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      DeclinedBloc.get(context)
                          .declinedModel
                          .resturant[index]
                          .custName!,
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
