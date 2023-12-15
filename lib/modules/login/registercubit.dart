import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/registermodel.dart';
import '../../network/End_Pionts.dart';
import '../../network/remote/dio_helper.dart';
import 'registerstate.dart';


class register_cubit extends Cubit<register_state> {
  register_cubit() : super(register_ini_state());
  static register_cubit get(context) => BlocProvider.of(context);



  bool isvisible =false;
  void changevisible(){
    isvisible=!isvisible;
    emit(register_changevisible_state());
  }

registermodel? registermodel_o;
  void register({required String email,required String password,required String name,required String phone,}) async{
    emit(register_loading_state());
    registermodel_o=null;
    await DioHelper.Postdata(url: REGISTER, data: {
      'email':email,
      'password':password,
      'name':name,
      'phone':phone
    }).then((value){
      print(value?.data);
      registermodel_o=registermodel.fromJson(value?.data);



      emit(register_success_state());
    }).catchError((error){
      print(error.toString());
      emit(register_error_state(error));
    });
  }
}
