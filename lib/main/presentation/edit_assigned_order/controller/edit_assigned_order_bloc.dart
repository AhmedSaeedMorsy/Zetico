// ignore_for_file: unnecessary_null_comparison

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import 'package:zetico/app/resources/color_manager.dart';
import 'package:zetico/app/services/dio_helper/dio_helper.dart';
import '../../../../app/resources/strings_manager.dart';
import 'edit_assigned_order_states.dart';

class EditAssignedOrderBloc extends Cubit<EditAssignedOrderStates> {
  EditAssignedOrderBloc() : super(EditAssignedOrderInitState());
  static EditAssignedOrderBloc get(context) => BlocProvider.of(context);
  late int currentValue;
  Color backgroundColorButtonSelectDate = ColorManager.white;
  Color backgroundColorButtonTomorrow = ColorManager.white;
  Color backgroundColorButtonToday = ColorManager.primaryColor;
  String selectDate = AppStrings.selectDate.tr();
  void changeNumberPicker(
    value,
  ) {
    currentValue = value;

    emit(ChangeNumberPickerState());
  }

  int price(int value) {
    int price = value * currentValue;
    return price;
  }

  void dateText(date) {
    if (date == null) {
      selectDate;
    }
    selectDate = date.toString();
    emit(ChangeStringSelectDate());
  }

  int currentIndexButton = 0;

  void changeBottonBackground(index) {
    currentIndexButton = index;
    if (index == 0) {
      backgroundColorButtonToday = ColorManager.primaryColor;
      backgroundColorButtonTomorrow = ColorManager.white;
      backgroundColorButtonSelectDate = ColorManager.white;
    } else if (index == 1) {
      backgroundColorButtonToday = ColorManager.white;
      backgroundColorButtonTomorrow = ColorManager.primaryColor;
      backgroundColorButtonSelectDate = ColorManager.white;
    } else if (index == 2) {
      backgroundColorButtonToday = ColorManager.white;
      backgroundColorButtonTomorrow = ColorManager.white;
      backgroundColorButtonSelectDate = ColorManager.primaryColor;
    }
    emit(ChangeBackgroungColorButton());
  }

  void editAssignedOrder({
    required String orderId,
    required String driverId,
    required String orderQty,
    required String orderDate,
    required String userId,
  }) {
    emit(EditAssignedOrderLoadingState());
    DioHelper.postData(path: ApiConstant.editAssignedOrderPath, data: {
      "orderId": orderId,
      "quantity": orderQty,
      "collectionDate": orderDate,
      "driverId": driverId,
      "userId": userId
    }).then((value) {
      emit(EditAssignedOrderSuccessState());
    }).catchError((error) {
      emit(EditAssignedOrderErrorState(error.toString()));
    });
  }
}
