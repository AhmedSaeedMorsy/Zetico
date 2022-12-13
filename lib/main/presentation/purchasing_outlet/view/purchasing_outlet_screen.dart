import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/main/presentation/purchasing_outlet/controller/purchsing_bloc.dart';
import 'package:zetico/main/presentation/purchasing_outlet/view/purchasing_outlet_view.dart';

class PurchasingOutletScreen extends StatelessWidget {
  const PurchasingOutletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PurchasingBloc()..getPurchsing(),
      child: const PurchasingOutletView(),
    );
  }
}
