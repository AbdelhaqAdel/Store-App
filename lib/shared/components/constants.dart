import 'package:new_app/modules/shop_App/login/ShopLogin.dart';
import 'package:new_app/shared/components/components.dart';

void printFullData(String text){
  final pattern=RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) {
    print(match.group((0)));
  });
}

String? Token;

void LogoOut(context){
  Token=null;
  NavigationAndFinish(context, ShopLogin());

}
// bool? onBoardingStatus;