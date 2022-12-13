import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/main/presentation/verified_outlet/controller/verfied_bloc.dart';
import 'package:zetico/main/presentation/verified_outlet/controller/verfied_states.dart';
import 'package:zetico/main/presentation/verified_outlet/view/verified_dialog.dart';
import '../../../../app/common/widget.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../../models/verfied_model.dart';

class VerifiedOutlet extends StatelessWidget {
 const VerifiedOutlet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerfiedBloc()..getVerfied(),
      child: BlocBuilder<VerfiedBloc, VerfiedStates>(builder: (context, state) {
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
                onFieldSubmitted: (String value) {
                  VerfiedBloc.get(context).searchVerfied(value);
                },
              ),
            ),
            Expanded(
              child: ConditionalBuilderRec(
                condition: state is VerfiedSearchSuccessState ||
                    state is VerfiedSuccessState,
                builder: (context) {
                  return itemBuilder(
                      VerfiedBloc.get(context).verfiedModel.resturant);
                },
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            SharedWidget.footer(context),
          ],
        );
      }),
    );
  }

  Widget itemBuilder(List<VerfiedResturantOutletModel> list) =>
      ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            showVerifiedDialog(context, list[index]);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / AppSize.s50,
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
                        list[index].outletNameEn!,
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s100,
                      ),
                      textItem(
                        context,
                        AppStrings.estQt.tr(),
                        list[index].quantity!,
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s100,
                      ),
                      textItem(
                        context,
                        AppStrings.price.tr(),
                        list[index].priceKg!,
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s100,
                      ),
                      textItem(
                        context,
                        AppStrings.area.tr(),
                        list[index].areaEn!,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    AppStrings.verifierName.tr(),
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
