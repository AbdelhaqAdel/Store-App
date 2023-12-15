import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../models/user/shop_model/LoginShopModel.dart';
import '../../../../../network/remote/dio_helper.dart';
import '../../../../../shared/network/EndPoint.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<ShopLoginState> {
  LoginCubit() : super(shopLoginInitialState());

  static LoginCubit get(context)=> BlocProvider.of(context);
  IconData suffix=Icons.visibility_outlined;
  bool ispassowrdShown=true;
  shopLoginModel ?loginModel;
  void UserLogin({
    required String email,
    required String password,
}){
    emit(shopLoginLoadingState());
    DioHelper.Postdata(
        url: LOGIN,
        data:{
          'email':email,
          'password':password,
        }).then((value) {
       loginModel= shopLoginModel.fromJson(value?.data);

       emit(shopLoginSuccessState(loginModel!));
        }).catchError((Error){
          print(Error.toString());
        emit(shopLoginErrorState(Error.toString()));
      });
  }
void changePasswordVisibility(){
  ispassowrdShown=!ispassowrdShown;

    suffix=ispassowrdShown?Icons.visibility_off_outlined:Icons.visibility_outlined;
  emit(shopLoginIsbasswordState());
}
}
