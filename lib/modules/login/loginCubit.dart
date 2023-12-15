import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/usernodel.dart';
import '../../network/End_Pionts.dart';
import '../../network/remote/dio_helper.dart';
import '../../shared/Const.dart';
import '../../shared/Cubit/Shop_cubit.dart';
import 'loginState.dart';

class login_cubit extends Cubit<login_state> {
  login_cubit() : super(login_ini_state());
  static login_cubit get(context) => BlocProvider.of(context);



  bool isvisible =false;
  void changevisible(){
    isvisible=!isvisible;
    emit(login_changevisible_state());
  }

  ShoploginModel? loginmodel;

  void login({required String email,required String password,required context}) async{
    emit(login_loading_state());
    await DioHelper.Postdata(url: LOGIN, data: {
      'email':email,
      'password':password,
    }).then((value){

     loginmodel= ShoploginModel.fromJson(value?.data);
      print(loginmodel?.status);
      print(loginmodel?.message);
      print(loginmodel?.data?.token);
      token=loginmodel?.data?.token;
     Shop_cubit.get(context).homedata_fun(token: token);
     Shop_cubit.get(context).Catogery_fun();
     Shop_cubit.get(context).favoomodel_fun(token: token);
     Shop_cubit.get(context).profile_fun(token: token);


      emit(login_success_state(loginmodel));
    }).catchError((error){
      print(error.toString());
      emit(login_error_state(error));
    });
  }
}
