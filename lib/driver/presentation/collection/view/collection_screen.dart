// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/driver/presentation/collection/view/collection_view.dart';
import '../../../model/on_progress_order_model.dart';
import '../controller/collection_order_bloc.dart';

class CollectionScreen extends StatelessWidget {
  OnProgressItemModel order;

  CollectionScreen({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CollectionOrderBloc(),
      child: CollectionView(order: order),
    );
  }
}
