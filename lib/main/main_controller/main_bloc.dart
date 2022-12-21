import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import '../../app/services/dio_helper/dio_helper.dart';
import '../../app/services/location_helper/location_helper.dart';
import '../models/area_model.dart';
import '../models/city_model.dart';
import '../models/roles_model.dart';
import 'main_states.dart';

class MainBloc extends Cubit<MainStates> {
  MainBloc() : super(MainInitState());
  static MainBloc get(context) => BlocProvider.of(context);

  String? longitude;
  String? latitude;
  getCurrentPosition() async {
    await LocationHelper.getCurrentLocation().whenComplete(() {
      getLongitudeAndLatitude();
      emit(GetCurrentLocationState());
    });
    getLongitudeAndLatitude();
  }

  getLongitudeAndLatitude() async {
    return await LocationHelper.getCurrentLocation().then((value) {
      latitude = value.latitude.toString();
      longitude = value.longitude.toString();
      emit(GetLongitudeAndLatitudeState());
    });
  }

  List<String> citises = [];
  CityModel cityModel = CityModel();
  void getCity() {
    emit(GetCityLoadingState());
    DioHelper.getData(
      path: ApiConstant.getCityPath,
    ).then((value) {
      cityModel = CityModel.fromjson(value.data);
      for (var element in cityModel.citises) {
        citises.add(element.governorateNameEn);
      }
      emit(GetCitySuccessState());
    }).catchError((error) {
      emit(GetCityErrorState(error.toString()));
    });
  }

  List<String> area = [];
  AreaModel areaModel = AreaModel();
  void getArea({required String city}) {
    emit(GetAreaLoadingState());
    DioHelper.getData(
      path: ApiConstant.getAreaPath(city),
    ).then((value) {
      areaModel = AreaModel.fromjson(value.data);
      area.clear();
      for (var element in areaModel.area) {
        area.add(element.cityNameEn);
      }
      emit(GetAreaSuccessState());
    }).catchError((error) {
      emit(GetAreaErrorState(error.toString()));
    });
  }

  RolesModel rolesModel = RolesModel();
  void getRoles({
    required String userId,
  }) {
    emit(RolesLoadingState());
    DioHelper.postData(path: ApiConstant.getRoles, data: {
      "userId": userId,
    }).then((value) {
      rolesModel = RolesModel.fromjson(value.data);
      emit(RolesSuccessState());
    }).catchError((error) {
      emit(RolesErrorState(error.toString()));
    });
  }
}
