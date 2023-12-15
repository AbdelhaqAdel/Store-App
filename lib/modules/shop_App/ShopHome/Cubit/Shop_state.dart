part of 'Shop_cubit.dart';

@immutable
abstract class ShopState {}

class shopHomeInitialState extends ShopState {}

class NavBar_state extends ShopState {}

class shopHomeLoadingState extends ShopState {}

class shopHomeSuccessState extends ShopState {

  shopHomeSuccessState();

}
class shopHomeErrorState extends ShopState {
  String? error;
  shopHomeErrorState(this.error);
}
/*----------------------*/
class shopCategoryLoadingState extends ShopState {}

class shopCategorySuccessState extends ShopState {

  shopCategorySuccessState();

}
class shopCategoryErrorState extends ShopState {

  shopCategoryErrorState();
}


class shopFavSuccessState extends ShopState {

  shopFavSuccessState();

}
class shopFavErrorState extends ShopState {

  shopFavErrorState();
}
class shopGetFavLoadingState extends ShopState {
  shopGetFavLoadingState();
}
class shopGetFavSuccessState extends ShopState {
  shopGetFavSuccessState();
}
class shopGetFavErrorState extends ShopState {

  shopGetFavErrorState();
}

class shopGetUserLoadingState extends ShopState {
  shopGetUserLoadingState();
}
class shopGetUserLSuccessState extends ShopState {
  shopGetUserLSuccessState();
}
class shopGetUserErrorState extends ShopState {

  shopGetUserErrorState();
}
/*-----------------*/
// class shopSearchLoadingState extends ShopState {}
//
// class shopSearchSuccessState extends ShopState {
//   final SearchModel searchModel;
//
//   shopSearchSuccessState(this.searchModel);
// }
//
// class shopSearchErrorState extends ShopState {
//   String? error;
//   shopSearchErrorState(this.error);
// }
