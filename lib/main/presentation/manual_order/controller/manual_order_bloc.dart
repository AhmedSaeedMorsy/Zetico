// ignore_for_file: unnecessary_null_comparison

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import 'package:zetico/app/resources/color_manager.dart';
import 'package:zetico/app/services/dio_helper/dio_helper.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../models/outlet_price_model.dart';
import 'manual_order_states.dart';

class ManualOrderBloc extends Cubit<ManualOrderStates> {
  ManualOrderBloc() : super(ManualOrderInitState());
  static ManualOrderBloc get(context) => BlocProvider.of(context);
  int currentValue = 0;
  int priceOutlet = 0;
  Color backgroundColorButtonSelectDate = ColorManager.white;
  Color backgroundColorButtonTomorrow = ColorManager.white;
  Color backgroundColorButtonToday = ColorManager.primaryColor;
  String selectDate = AppStrings.selectDate.tr();
  void changeNumberPicker(value) {
    currentValue = value;
    priceOutlet = price(double.parse(outletPriceModel.outlet[0].priceKg!));
    emit(ChangeNumberPickerState());
  }

  OutletPriceModel outletPriceModel = OutletPriceModel();
  void getPrice({required String outletName}) {
    DioHelper.postData(path: ApiConstant.getOutletPrice, data: {
      "outletName": outletName,
    }).then((value) {
      outletPriceModel = OutletPriceModel.fromjson(value.data);
      priceOutlet = price(double.parse(outletPriceModel.outlet[0].priceKg!));
      emit(OutletPriceSuccessState());
    }).catchError((error) {
      emit(OutletPriceErrorState(error.toString()));
    });
  }

  int price(double value) {
    double price = value * currentValue;
    return price.toInt();
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

  void addNewOrder({
    required String outletId,
    required String orderQty,
    required String orderDate,
    required String userId,
  }) {
    emit(AddOrderLoadingState());
    DioHelper.postData(path: ApiConstant.addOrderPath, data: {
      "outletId": outletId,
      "orderQty": orderQty,
      "orderDate": orderDate,
      "userId": userId,
    }).then((value) {
      emit(AddOrderSuccessState());
    }).catchError((error) {
      emit(AddOrderErrorState(error.toString()));
    });
  }
}
