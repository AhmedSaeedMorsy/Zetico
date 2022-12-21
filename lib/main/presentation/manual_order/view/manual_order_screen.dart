import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/main/presentation/manual_order/controller/manual_order_bloc.dart';

import 'manual_order_view.dart';

class ManualOrderScreen extends StatelessWidget {
  const ManualOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ManualOrderBloc()..getOutlets(),
        child: ManualOrderView());
  }
}
