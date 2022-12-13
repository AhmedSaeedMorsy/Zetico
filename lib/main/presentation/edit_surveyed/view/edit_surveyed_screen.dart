// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/app/resources/strings_manager.dart';
import 'package:zetico/main/main_controller/main_bloc.dart';
import 'package:zetico/main/presentation/edit_surveyed/controller/edit_surveyed_bloc.dart';
import 'package:zetico/main/presentation/edit_surveyed/view/edit_surveyed_view.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../models/survyed_outlet_model.dart';

class EditSurveyed extends StatelessWidget {
  EditSurveyed({super.key, required this.outlet});

  SurveyedResturantOutletModel outlet;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EditSurvyedBloc(),
        ),
        BlocProvider(
          create: (context) => MainBloc()
            ..getCity()
            ..getCurrentPosition()
            ..getLongitudeAndLatitude(),
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
        body: EditSurveyedView(
          outlet: outlet,
        ),
      ),
    );
  }
}
