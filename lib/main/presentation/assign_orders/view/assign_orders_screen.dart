import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/main/presentation/assign_orders/controller/assigned_orders_bloc.dart';
import 'assign_orders_view.dart';

class AssignOrdersScreen extends StatelessWidget {
  const AssignOrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AssignedOrdersBloc()..getAssignedOrders(),
      child: const AssignOrdersView(),
    );
  }
}
