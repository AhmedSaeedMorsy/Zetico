// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/main/presentation/edit_purchasing/view/edit_purchasing_view.dart';

import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../main_controller/main_bloc.dart';
import '../../../models/verfied_model.dart';
import '../controller/edit_purchasing_bloc.dart';

class EditPurchasingScreen extends StatelessWidget {
  EditPurchasingScreen({super.key, required this.model});
  VerfiedResturantOutletModel model;
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
        BlocProvider(
          create: (context) => EditPurchasingBloc(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.editData.tr(),
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: FontSizeManager.s16.sp),
          ),
        ),
        body: EditPurchasingView(
          model: model,
        ),
      ),
    );
  }
}
