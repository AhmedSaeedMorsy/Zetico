// ignore_for_file: must_be_immutable
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/main/main_controller/main_bloc.dart';
import 'package:zetico/main/presentation/edit_verified/controller/edit_verified_bloc.dart';
import 'package:zetico/main/presentation/edit_verified/view/edit_verified_view.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../models/verfied_model.dart';

class EditVerifiedScreen extends StatelessWidget {
  EditVerifiedScreen({
    super.key,
    required this.outlet,
  });
  VerfiedResturantOutletModel outlet;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EditVerifiedBloc(),
        ),
        BlocProvider(
          create: (context) => MainBloc()
            ..getCity()
            ..getCurrentPosition()
            ..getLongitudeAndLatitude(),
        ),
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
        body: EditVerifiedView(
          outlet: outlet,
        ),
      ),
    );
  }
}
