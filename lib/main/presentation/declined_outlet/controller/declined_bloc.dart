import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zetico/app/constant/api_constant.dart';
import '../../../../app/services/dio_helper/dio_helper.dart';
import '../../../models/declined_model.dart';
import 'declined_states.dart';

class DeclinedBloc extends Cubit<DeclinedStates> {
  DeclinedBloc() : super(DeclinedInitState());

  static DeclinedBloc get(context) => BlocProvider.of(context);

  DeclinedOutletModel declinedModel = DeclinedOutletModel();
  void getDeclined() {
    emit(DeclinedLoadingState());
    DioHelper.getData(
      path: ApiConstant.getDeclinedPath,
    ).then((value) {
      declinedModel = DeclinedOutletModel.fromjson(value.data);
      emit(DeclinedSuccessState());
    }).catchError((error) {
      emit(DeclinedErrorState(error.toString()));
    });
  }
}
