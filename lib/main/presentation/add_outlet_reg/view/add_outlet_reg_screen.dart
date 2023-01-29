// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/app/resources/strings_manager.dart';
import 'package:zetico/main/main_controller/main_bloc.dart';
import 'package:zetico/main/presentation/add_outlet/view/add_outlet_view.dart';
import '../../../../app/resources/font_manager.dart';
import '../controller/add_outlet_reg_bloc.dart';

class AddOutletRegScreen extends StatelessWidget {
  const AddOutletRegScreen({super.key});

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
          create: (context) => AddOutletRegBloc(),
        )
      ],
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.addOutlet.tr(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: FontSizeManager.s14.sp,
                  ),
            ),
          ),
          body: AddOutletView()),
    );
  }
}
