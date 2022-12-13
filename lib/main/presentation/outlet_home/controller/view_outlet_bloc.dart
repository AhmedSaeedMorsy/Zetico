import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:zetico/app/constant/api_constant.dart';
import 'package:zetico/main/presentation/outlet_home/controller/view_outlet_states.dart';
import '../../../../app/services/dio_helper/dio_helper.dart';
import '../../../models/view_outlet_models.dart';

class ViewOutletBloc extends Cubit<ViewOutletStates> {
  ViewOutletBloc() : super(ViewOutletInitState());

  static ViewOutletBloc get(context) => BlocProvider.of(context);
  List<ResturantModel> resturantNotAgreed = [];
  List<ResturantModel> resturantAgreed = [];
  List<ResturantModel> resturantActive = [];
  List<ResturantModel> resturantInActive = [];
  List<ResturantModel> resturantOutlet = [];

  ViewOutletModel viewOutletModel = ViewOutletModel();
  void getViewOutlet() {
  
    emit(ViewOutletLoadingState());
    DioHelper.getData(
      path: ApiConstant.viewOutletPath,
    ).then((value) {
      viewOutletModel = ViewOutletModel.fromjson(value.data);
      for (var element in viewOutletModel.resturant) {
        resturantOutlet.add(element);
        if (element.status == "PROCEED") {
          resturantNotAgreed.add(element);
        }
        if (element.status == "APPROVED") {
          resturantAgreed.add(element);
          DateTime lastCollection =
              DateFormat("yyyy-MM-dd").parse(element.lastCollection!);
          if (daysBetweenTowDates(lastCollection) < 60) {
            resturantActive.add(element);
          } else {
            resturantInActive.add(element);
          }
        }
      }
      emit(ViewOutletSuccessState());
    }).catchError((error) {
      emit(ViewOutletErrorState(error.toString()));
    });
  }

// difference between Dates in Day
  int daysBetweenTowDates(DateTime date2) {
    DateTime dateNow = DateTime.now();
    return dateNow.difference(date2).inDays;
  }

  ViewOutletModel viewOutletSearch = ViewOutletModel();
  void searchOutlet(String outletName) {
    emit(ViewOutletSearchLoadingState());
    DioHelper.getData(
      path: ApiConstant.searchOutletPath(outletName),
    ).then((value) {
      viewOutletSearch = ViewOutletModel.fromjson(value.data);
      resturantOutlet = viewOutletSearch.resturant;
      emit(ViewOutletSearchSuccessState());
    }).catchError((error) {
      emit(ViewOutletSearchErrorState(error.toString()));
    });
  }

  ViewOutletModel agreedSearch = ViewOutletModel();
  void searchAgreed(String outletName) {
    emit(AgreedSearchLoadingState());
    DioHelper.getData(
      path: ApiConstant.searchAgreedPath(outletName),
    ).then((value) {
      agreedSearch = ViewOutletModel.fromjson(value.data);
      resturantAgreed = agreedSearch.resturant;
      emit(AgreedSearchSuccessState());
    }).catchError((error) {
      emit(AgreedSearchErrorState(error.toString()));
    });
  }

  ViewOutletModel activeSearch = ViewOutletModel();
  void searchActive(String outletName) {
    emit(ActiveSearchLoadingState());
    DioHelper.getData(
      path: ApiConstant.searchActivePath(outletName),
    ).then((value) {
      activeSearch = ViewOutletModel.fromjson(value.data);
      resturantActive = activeSearch.resturant;
      emit(ActiveSearchSuccessState());
    }).catchError((error) {
      emit(ActiveSearchErrorState(error.toString()));
    });
  }

  ViewOutletModel inActiveSearch = ViewOutletModel();
  void searchInActive(String outletName) {
    emit(InActiveSearchLoadingState());
    DioHelper.getData(
      path: ApiConstant.searchInActivePath(outletName),
    ).then((value) {
      inActiveSearch = ViewOutletModel.fromjson(value.data);
      resturantInActive = inActiveSearch.resturant;
      emit(InActiveSearchSuccessState());
    }).catchError((error) {
      emit(InActiveSearchErrorState(error.toString()));
    });
  }

  ViewOutletModel notAgreedSearch = ViewOutletModel();
  void searchNotAgreed(String outletName) {
    emit(NotAgreedSearchLoadingState());
    DioHelper.getData(
      path: ApiConstant.searchNotAgreedPath(outletName),
    ).then((value) {
      notAgreedSearch = ViewOutletModel.fromjson(value.data);
      resturantNotAgreed = notAgreedSearch.resturant;
      emit(NotAgreedSearchSuccessState());
    }).catchError((error) {
      emit(NotAgreedSearchErrorState(error.toString()));
    });
  }
}
