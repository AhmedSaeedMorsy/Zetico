import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/main/presentation/issued_orders/controller/issued_orders_bloc.dart';

import 'issued_orders_view.dart';

class IssuedOrdersScreen extends StatelessWidget {
  const IssuedOrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>IssuedOrdersBloc()..getIssuedOrders(),
      child: const IssuedOrdersView(),
    );
  }
}
