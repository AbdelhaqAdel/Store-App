import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:new_app/models/user/shop_model/GetFavoritesModel.dart';
import 'package:new_app/models/user/shop_model/LoginShopModel.dart';
import '../../../../models/user/shop_model/Categories_model.dart';
import '../../../../models/user/shop_model/HomeModel.dart';
import '../../../../network/remote/dio_helper.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/network/EndPoint.dart';
import '../../ShopScreen/HomeScreen/CategoriesScreen/CategoriesScreen.dart';
import '../../ShopScreen/HomeScreen/FavoritesScreen/FavoritesScreen.dart';
import '../../ShopScreen/HomeScreen/SettingsScreen/SettingsScreen.dart';
import '../../ShopScreen/HomeScreen/ShopHomeScreen.dart';

part 'Shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(shopHomeInitialState());
  static ShopCubit get(context)=> BlocProvider.of(context);


  List<Widget> NavBar = [ShopHomeScreen(), Categories(), Favorite(), SettingsScreen()];
  int NavBar_index = 0;
  void NavBar_M({required index}) {
    NavBar_index = index;
    emit(NavBar_state());
  }
  HomeModel? homedata;
  Map<int,bool>favoraties={};
  void GetHomeData({
    required String? token,
  }) {
    emit(shopHomeLoadingState());
    DioHelper.Getdata(url: HOME, token: token).then((value) {
      // print(value?.data);
      print('_________________________________________');
      print('_________________________________________');
      homedata = HomeModel.fromJson(value?.data);
      //print(token);
         homedata?.data?.products?.forEach((element) {
         favoraties.addAll({
           element.id!: element.inFavorites!,
         });
       });
       print(favoraties.toString());

      emit(shopHomeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(shopHomeErrorState(error));
    });
  }
  /*-----------------------------------*/
  favmodel? fav;
  void ChangeFav({
    required int? productId,
}){
    favoraties[productId!]=!favoraties[productId]!;  //for added or deleted in moment
    GetFavoritesDatal(token: Token);
    emit(shopFavSuccessState());

    DioHelper.Postdata(
        url: FAVORITES,
        data:{'product_id': productId} ,
        token: Token
    ).then((value) {

      fav=favmodel.fromJson(value?.data);
      print(value?.data);
      if (!fav!.status!){
        favoraties[productId]=!favoraties[productId]!;  //when it has an error in success state
        Fluttertoast.showToast(
            msg:fav!.message!,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }else{
        GetFavoritesDatal(token: Token);
      }
      emit(shopFavSuccessState());
    }).catchError((onError){
      print(onError);
      favoraties[productId]=!favoraties[productId]!;
      emit(shopFavSuccessState());
    });
  }





  /*---------------------------------*/
  Categories_model ? categories;
 // List<Datum> categorisList=[];
  void GetcategoriesData({
    required String? token,
  }) {
    emit(shopCategoryLoadingState());
    DioHelper.Getdata(url: CATEGORIES, token: Token).then((value) {
      // print(value?.data);
      print('_________________________________________');
      print('_________________________________________');
      categories=Categories_model.fromJson(value?.data);
      print(token);
      print('_________________________________________');
      print('_________________________________________');
      // print(homedata?.status);
      print(categories?.data!.data?[0].image);
      List Json = value?.data['response'];

      // for (var element in Json) {
      //   categorisList.add(Datum.fromJson(element));
      // }
      // for(var ss in categorisList) {
      //   print(ss.image);
      // }
      // homedata?.data?.products?.forEach((element) {
      // favorites.addAll({
      //   element.id: element.inFavorites,
      // });
      // });
      // print(favorites);
      //
      // print('_________________________________________');
      // print('_________________________________________');

      emit(shopCategorySuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(shopCategoryErrorState());
    });
  }

  /*---------------------------------*/

  GetFavoritesModel ? getFavoritesModel;
  // List<Datum> categorisList=[];
  void GetFavoritesDatal({
    required String? token,
  }) {
    emit(shopCategoryLoadingState());
    DioHelper.Getdata(url: FAVORITES, token: Token).then((value) {
      emit(shopGetFavLoadingState());
      // print(value?.data);
      print('_________________________________________');
      print('_________________________________________');
      getFavoritesModel=GetFavoritesModel.fromJson(value?.data);
      print(token);
      print('_________________________________________');
      print('_________________________________________');
      // print(homedata?.status);
      print(getFavoritesModel?.data?.data?[0].product?.image);
      //List Json = value?.data['response'];

      // for (var element in Json) {
      //   categorisList.add(Datum.fromJson(element));
      // }
      // for(var ss in categorisList) {
      //   print(ss.image);
      // }
      // homedata?.data?.products?.forEach((element) {
      // favorites.addAll({
      //   element.id: element.inFavorites,
      // });
      // });
      // print(favorites);
      //
      // print('_________________________________________');
      // print('_________________________________________');

      emit(shopGetFavSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(shopGetFavErrorState());
    });
  }

  /*-----------------------------------------*/

  UserProfileModel ? userData;
  void GetUserData({
    required String? token,
  }) {
    DioHelper.Getdata(url: PROFILE, token: Token).then((value) {
      emit(shopGetUserLoadingState());
       userData=UserProfileModel.fromJson(value?.data);
      print(value?.data);
      // print(homedata?.status);
      print('//////////');
      print(userData?.data?.name);
      emit(shopGetUserLSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(shopGetUserErrorState());
    });
  }


}





/* if(value.statusCode==200) {
        List Json = value.data;
        for (var element in Json) {
          home.add(HomeModel.fromJson(element));
        }
        for (var element2 in home) {
          print(element2.status);
        }
        emit(shopHomeSuccessState());*/