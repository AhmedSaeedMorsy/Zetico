import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/main/presentation/on_progress_orders/controller/on_progress_orders_bloc.dart';
import 'on_progress_orders_view.dart';

class OnProgressOrdersScreen extends StatelessWidget {
  const OnProgressOrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnProgressOrdersBloc()..getOnProgressOrders(),
      child: const OnProgressOrdersView(),
    );
  }
}
