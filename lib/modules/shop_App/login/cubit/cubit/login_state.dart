part of 'login_cubit.dart';

@immutable
abstract class ShopLoginState {}

class shopLoginInitialState extends ShopLoginState {}

class shopLoginLoadingState extends ShopLoginState {}

class shopLoginSuccessState extends ShopLoginState {
   final shopLoginModel loginmodel;
  shopLoginSuccessState(this.loginmodel);
}

class shopLoginErrorState extends ShopLoginState {
   String? error;
   shopLoginErrorState(this.error);
}
class shopLoginIsbasswordState extends ShopLoginState {}


