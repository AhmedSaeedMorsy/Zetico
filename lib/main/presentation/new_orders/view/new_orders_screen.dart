import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/main/presentation/new_orders/controller/new_orders_bloc.dart';
import 'new_orders_view.dart';

class NewOrdersScreen extends StatelessWidget {
  const NewOrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NewOrdersBloc()..getNewOrders(),
        child: const NewOrdersView());
  }
}
