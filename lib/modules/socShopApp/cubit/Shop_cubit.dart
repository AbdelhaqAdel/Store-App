import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/Seachmodel.dart';
import '../../modules/socShopApp/updatemodel.dart';
import '../../models/usernodel.dart';
import '../../modules/Screen_layout/S1.dart';
import '../../modules/Screen_layout/S2.dart';
import '../../modules/Screen_layout/S3.dart';
import '../../modules/Screen_layout/S4.dart';
import '../../network/End_Pionts.dart';
import '../../network/remote/dio_helper.dart';
import 'Shop_state.dart';

class Shop_cubit extends Cubit<Shop_state> {
  Shop_cubit() : super(product_ini_state());
  static  Shop_cubit get(context) => BlocProvider.of(context);

  List<Widget> NavBar = [S1(), S2(), S3(), S4()];
  int NavBar_index = 0;
  void NavBar_M({required index}) {
    NavBar_index = index;

    emit(NavBar_state());
  }

  Map<int?, bool?> favorites = {};
  HomeModel? homedata;
  void homedata_fun({
    required String? token,
  }) {
    emit(product_loading_state());
    DioHelper.Getdata(url: HOME, token: token).then((value) {
      // print(value?.data);
      print('_________________________________________');
      print('_________________________________________');
      homedata = HomeModel.fromJson(value?.data);
      print(token);
      print('_________________________________________');
      print('_________________________________________');
      // print(homedata?.status);
      // print(homedata?.data?.products);
      homedata?.data?.products?.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      });
      // print(favorites);
      //
      // print('_________________________________________');
      // print('_________________________________________');

      emit(product_success_state());
    }).catchError((error) {
      print(error.toString());
      emit(product_error_state(error));
    });
  }



  favoomodel? favoomoodel;
  void favoomodel_fun({
    required String? token,
  })async {

    emit(favoo_loading_state());
    await DioHelper.Getdata(url: FAV, token: token).then((value) {
      favoomoodel = favoomodel.fromJson(value?.data);

      emit(favoo_success_state());
    }).catchError((error) {
      print(error.toString());
      emit(favoo_error_state(error));
    });
  }



  favmodel? favmoodel;
  void favorites_fun({required String? token, required int? id})async {
    // ignore: unnecessary_non_null_assertion
    favorites[id] = favorites[id] == null ? false : !favorites[id]!;

    emit(fav_loading_state());

    await DioHelper.Postdata(url: FAV, data: {'product_id': id}, token: token)
        .then((value) {
      print(value?.data);
      favmoodel = favmodel.fromJson(value?.data);
      if (favmoodel?.status == false) {
        favorites[id] = favorites[id] == null ? false : !favorites[id]!;
      } else {
        favoomodel_fun(token: token);
      }
      emit(fav_success_state());
    }).catchError((error) {
      print(error.toString());
      emit(fav_error_state(error));
    });
  }



  Catogerymodel? catogerymodel;
  void Catogery_fun({
    String? token,
  })async {
    emit(category_loading_state());
  await  DioHelper.Getdata(url: CAT, token: token).then((value) {
      // print(value?.data);
      // print('_________________________________________');
      // print('_________________________________________');
      catogerymodel = Catogerymodel.fromJson(value?.data);
      // print('_________________________________________');
      // print('_________________________________________');
      // // print(catogerymodel?.status);
      // // print(catogerymodel?.data?.data);
      // print('_________________________________________');
      // print('_________________________________________');

      emit(category_success_state());
    }).catchError((error) {
      print(error.toString());
      emit(category_error_state(error));
    });
  }




  profilemodel? profilemodelo;
  void profile_fun({
    String? token,
  })async {

    emit(profile_loading_state());
  await  DioHelper.Getdata(url: PROFILE, token: token).then((value) {
      print(value?.data);
      // print('_________________________________________');
      // print('_________________________________________');
      profilemodelo = profilemodel.fromJson(value?.data);
      // print('_________________________________________');
      // print('_________________________________________');
      // // print(catogerymodel?.status);
      // // print(catogerymodel?.data?.data);
      // print('_________________________________________');
      // print('_________________________________________');

      emit(profile_success_state());
    }).catchError((error) {
      print(error.toString());
      emit(profile_error_state(error));
    });
  }




  searchmodel? searchmodel_o;
  void search_fun({String? token, required String? text}) {
    emit(search_loading_state());
    DioHelper.Postdata(url: SEARCH, token: token, data: {'text': text})
        .then((value) {
      print(value?.data);
      // print('_________________________________________');
      // print('_________________________________________');
      searchmodel_o = searchmodel.fromJson(value?.data);
      // print('_________________________________________');
      // print('_________________________________________');
      // // print(catogerymodel?.status);
      // // print(catogerymodel?.data?.data);
      // print('_________________________________________');
      // print('_________________________________________');

      emit(search_success_state());
    }).catchError((error) {
      print(error.toString());
      emit(search_error_state(error));
    });
  }





  updatemodel? updatemodel_o;
  void update_fun({
    String? token,
    required String? name,
    required String? email,
    required String? phone,
  }) async {
    emit(update_loading_state());
    await DioHelper.Putdata(
        url: UPDATE,
        token: token,
        data: {'name': name, 'email': email, 'phone': phone}).then((value) {
      print(value?.data);

      print(email);
      print(name);
      print(phone);
      // print('_________________________________________');
      updatemodel_o = updatemodel.fromJson(value?.data);
      if(updatemodel_o?.data==null)
        {
          updatemodel_o=null;
        }
      else
      token=updatemodel_o?.data?.token;
      // print('_________________________________________');
      // print('_________________________________________');
      // // print(catogerymodel?.status);
      // // print(catogerymodel?.data?.data);
      // print('_________________________________________');
      // print('_________________________________________');
      profile_fun(token: token);
      emit(update_success_state());

    }).catchError((error) {
      print(error.toString());
      emit(update_error_state(error));
    });
  }
}
