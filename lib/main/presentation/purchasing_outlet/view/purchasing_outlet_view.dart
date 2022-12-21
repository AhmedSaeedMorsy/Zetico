import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/main/presentation/purchasing_outlet/view/purchasing_dialog.dart';
import '../../../../app/common/widget.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../../../app/services/shared_prefrences/cache_helper.dart';
import '../../../models/verfied_model.dart';
import '../controller/purchasing_states.dart';
import '../controller/purchsing_bloc.dart';

class PurchasingOutletView extends StatelessWidget {
  const PurchasingOutletView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchasingBloc, PurchasingStates>(
        builder: (context, state) {
      if (CacheHelper.getData(key: SharedKey.roleCreate)
              .toString()
              .contains("purchasing") ||
          CacheHelper.getData(key: SharedKey.roleEdit)
              .toString()
              .contains("purchasing") ||
          CacheHelper.getData(key: SharedKey.roleDelete)
              .toString()
              .contains("purchasing") ||
          CacheHelper.getData(key: SharedKey.roleSpecial)
              .toString()
              .contains("reassignPurchasing")) {
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
                    PurchasingBloc.get(context).searchPurchesing(value);
                  }),
            ),
            Expanded(
                child: ConditionalBuilderRec(
              condition: state is PurchsingSuccessState ||
                  state is PurchsingSearchSuccessState,
              builder: (context) => itemBuilder(
                PurchasingBloc.get(context).purchsingModel.resturant,
              ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            )),
            SharedWidget.footer(context),
          ],
        );
      } else {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / AppSize.s180,
            horizontal: MediaQuery.of(context).size.width / AppSize.s50,
          ),
          child: Center(
            child: Text(
              AppStrings.permissionStringWarning.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        );
      }
    });
  }

  Widget itemBuilder(List<VerfiedResturantOutletModel> list) =>
      ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            showPurchasingDialog(
              context,
              list[index],
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
                    AppStrings.purchaserName.tr(),
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
