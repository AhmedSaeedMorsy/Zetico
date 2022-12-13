// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/app/resources/strings_manager.dart';
import 'package:zetico/main/main_controller/main_bloc.dart';
import 'package:zetico/main/presentation/approve_purchasing/view/approve_purchasing_view.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../models/verfied_model.dart';
import '../controller/approve_purchasing_bloc.dart';

class ApprovePurchasingScreen extends StatelessWidget {
  ApprovePurchasingScreen({
    super.key,
    required this.outlet,
  });
  VerfiedResturantOutletModel outlet;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainBloc()
            ..getCity()
            ..getCurrentPosition()
            ..getLongitudeAndLatitude(),
        ),
        BlocProvider(create: (context) => ApprovePurchasingBloc()),
      ],
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.approvePurchasing.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: FontSizeManager.s14.sp),
            ),
          ),
          body: ApprovePurchasingView(outlet: outlet,)),
    );
  }
}
