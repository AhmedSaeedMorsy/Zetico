import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/main/presentation/surveyed_outlet/controller/survyed_bloc.dart';
import 'package:zetico/main/presentation/surveyed_outlet/view/surveyed_outlet_view.dart';

class SurveyedOutlet extends StatelessWidget {
  const SurveyedOutlet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurveyedBloc()..getSurvyed(),
      child:const SurveyedOutletView(),
    );
  }
}
