import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/collected_orders_bloc.dart';
import 'collected_orders_view.dart';

class CollectedOrdersScreen extends StatelessWidget {
  const CollectedOrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CollectedOrdersBloc()..getCollectedOrders(),
      child: const CollectedOrdersView(),
    );
  }
}
