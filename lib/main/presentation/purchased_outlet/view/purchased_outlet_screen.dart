import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/purchsed_bloc.dart';
import 'purchased_outlet_view.dart';

class PurchasedOutletScreen extends StatelessWidget {
  const PurchasedOutletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PurchsedBloc()..getPurchsed(),
      child: const PurchasedOutletView(),
    );
  }
}
