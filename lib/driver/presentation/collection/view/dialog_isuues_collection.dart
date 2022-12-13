import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/driver/presentation/collection/controller/collection_order_bloc.dart';
import 'package:zetico/driver/presentation/collection/controller/collection_order_states.dart';

import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/values_manager.dart';

Future showDialogCollection(BuildContext context) => showDialog(
      context: context,
      builder: (context) => BlocProvider(
        create: (context) => CollectionOrderBloc()..getIssues(),
        child: BlocBuilder<CollectionOrderBloc, CollectionOrderStates>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height / AppSize.s50,
                ),
                color: ColorManager.lightGrey,
              ),
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / AppSize.s10,
                horizontal: MediaQuery.of(context).size.height / AppSize.s18,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / AppSize.s20,
                  horizontal: MediaQuery.of(context).size.width / AppSize.s30,
                ),
                child: ConditionalBuilderRec(
                  condition: state is IssuedSuccessState,
                  builder: (context) => ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => headText(
                        context,
                        CollectionOrderBloc.get(context)
                            .issuesModel
                            .issue[index]
                            .issuedName!,
                        CollectionOrderBloc.get(context)
                            .issuesModel
                            .issue[index]),
                    separatorBuilder: (context, index) => SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s22,
                    ),
                    itemCount: CollectionOrderBloc.get(context)
                        .issuesModel
                        .issue
                        .length,
                  ),
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );

Widget headText(BuildContext context, String text, issueModel) => Container(
      padding: const EdgeInsetsDirectional.all(AppSize.s16),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s100)),
          border: Border.all(
            color: ColorManager.primaryColor,
          )),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context, issueModel);
        },
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: FontSizeManager.s12.sp,
              ),
        ),
      ),
    );
