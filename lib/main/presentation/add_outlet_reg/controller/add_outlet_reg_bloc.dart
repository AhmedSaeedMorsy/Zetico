import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import '../../../../app/services/dio_helper/dio_helper.dart';
import '../../../models/survyed_outlet_model.dart';
import '../../../models/view_outlet_models.dart';
import 'add_outlet_reg_states.dart';

class AddOutletRegBloc extends Cubit<AddOutletRegStates> {
  AddOutletRegBloc() : super(AddOutletInitState());

  static AddOutletRegBloc get(context) => BlocProvider.of(context);
  SurveyedResturantOutletModel addOutletModel = SurveyedResturantOutletModel();

  ViewOutletModel viewOutletModel = ViewOutletModel();
  void getViewOutlet() {
    emit(ViewOutletLoadingState());
    DioHelper.getData(
      path: ApiConstant.viewOutletPath,
    ).then((value) {
      viewOutletModel = ViewOutletModel.fromjson(value.data);

      emit(ViewOutletSuccessState());
    }).catchError((error) {
      emit(ViewOutletErrorState(error.toString()));
    });
  }
}
