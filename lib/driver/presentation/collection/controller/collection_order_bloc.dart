import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import 'package:zetico/app/services/dio_helper/dio_helper.dart';
import '../../../model/issues_model.dart';
import 'collection_order_states.dart';

class CollectionOrderBloc extends Cubit<CollectionOrderStates> {
  CollectionOrderBloc() : super(CollectionOrderInitState());
  static CollectionOrderBloc get(context) => BlocProvider.of(context);
  bool isChecked = false;
  int currentHundredValue = 0;
  int currentThousandsValue = 0;
  double quantity = 0.0;
  int currentDozensValue = 0;
  int currentOnesValue = 0;
  int currentDecimalValue = 0;

  void changeCheckBox() {
    isChecked = !isChecked;
    emit(ChangeCheckBoxState());
  }

  void changeHundredNumberPicker(
    value,
  ) {
    currentHundredValue = value;
    changePrice();

    emit(ChangeNumberPickerState());
  }

  void changeThousandsNumberPicker(
    value,
  ) {
    currentThousandsValue = value;
    changePrice();

    emit(ChangeNumberPickerState());
  }

  void changeDozensNumberPicker(
    value,
  ) {
    currentDozensValue = value;
    changePrice();

    emit(ChangeNumberPickerState());
  }

  void changeOnesNumberPicker(
    value,
  ) {
    currentOnesValue = value;
    changePrice();
    emit(ChangeNumberPickerState());
  }

  void changeDecimalNumberPicker(
    value,
  ) {
    currentDecimalValue = value;
    changePrice();
    emit(ChangeNumberPickerState());
  }

  void changePrice() {
    quantity = currentThousandsValue * 1000 +
        currentHundredValue * 100 +
        currentDozensValue * 10 +
        currentOnesValue +
        currentDecimalValue / 10;
    emit(ChangePriceState());
  }

  double getPrice(int value) {
    double price = value * quantity;
    price = double.parse((price).toStringAsFixed(2));
    return price;
  }

  void postCollectionOrder({
    required String orderId,
    required String collectedQuantity,
  }) {
    emit(CollectionOrderLoadingState());
    DioHelper.postData(path: ApiConstant.collectionOrderPath, data: {
      "orderId": orderId,
      "collectedQuantity": collectedQuantity,
    }).then((value) {
      emit(CollectionOrderSuccessState());
    }).catchError((error) {
      emit(CollectionOrderErrorState(error.toString()));
    });
  }

  IssuesModel issuesModel = IssuesModel();
  void getIssues() {
    emit(IssuedLoadingState());
    DioHelper.getData(path: ApiConstant.getIssuesPath).then((value) {
      issuesModel = IssuesModel.fromJson(
        value.data,
      );
      emit(IssuedSuccessState());
    }).catchError((error) {
      emit(IssuedErrorState(error.toString()));
    });
  }

  void postIssuesOrder({
    required String orderId,
    required String issueId,
    required String issueDate,
    required String issueComment,
  }) {
    emit(PostIssuedLoadingState());
    DioHelper.postData(path: ApiConstant.issuesOrderPath, data: {
      "orderId": orderId,
      "issueId": issueId,
      "issueDate": issueDate,
      "issueComment": issueComment,
    }).then((value) {
      emit(PostIssuedSuccessState());
    }).catchError((error) {
      // print(error.toString());
      emit(PostIssuedErrorState(error.toString()));
    });
  }
}
