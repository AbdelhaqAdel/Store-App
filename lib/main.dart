import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/shop_App/Layout/LayoutScreen.dart';
import 'modules/shop_App/On_boarding/onBoardingScreen.dart';
import 'network/local/SharedPreferences.dart';
import 'network/remote/dio_helper.dart';
import 'shared/components/bloc_observer.dart';

void main() async{

   WidgetsFlutterBinding.ensureInitialized();
   
    Bloc.observer = MyBlocObserver();
    DioHelper.init();
   await CachHelper.init;
   Widget widget;
   WidgetsFlutterBinding.ensureInitialized();
   // await Firebase.initializeApp(
   //   options: DefaultFirebaseOptions.currentPlatform,
   // );
   //token=DioHelper.GetData()
   //Token=CachHelper.getData(key: 'token');
   //print(Token);
   bool? isDark =CachHelper.getData(key: 'isDark');
   bool? OnBoarding = CachHelper.getData(key: 'onboarding');
   print(OnBoarding);
   // if (OnBoarding != null) {
   //   if (Token != null) {
   //     widget = Shoplayout();
   //   } else {
   //     widget = ShopLogin();
   //   }
   // } else {
   //   widget = OnBoarding()!;
   // }

   runApp(
      MyApp(
    isDark: isDark,
    onBoarding: OnBoarding,
  )
  );
}

class MyApp extends StatelessWidget {

 // const MyApp({Key? key}) : super(key: key);
  final bool? isDark ;
  final bool? onBoarding ;
  MyApp({
    this.isDark,
    this.onBoarding
});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { 
    return  MaterialApp(
      debugShowCheckedModeBanner: false,

      //theme: LightTheme,
      //darkTheme:darkTheme,
     // themeMode:appcubit.get(context).isDark ?ThemeMode.dark : ThemeMode.light ,
      home: onBoarding==true ?Shoplayout():OnBoarding (),
    );
    
  }
 // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(StringProperty('x', x));
  // }
}


/// | headline1  | 96.0 | light   | -1.5     |             |
/// | headline2  | 60.0 | light   | -0.5     |             |
/// | headline3  | 48.0 | regular |  0.0     |             |
/// | headline4  | 34.0 | regular |  0.25    |             |
/// | headline5  | 24.0 | regular |  0.0     |             |
/// | headline6  | 20.0 | medium  |  0.15    |             |
/// | subtitle1  | 16.0 | regular |  0.15    |             |
/// | subtitle2  | 14.0 | medium  |  0.1     |             |
/// | body1      | 16.0 | regular |  0.5     | (bodyText1) |
/// | body2      | 14.0 | regular |  0.25    | (bodyText2) |
/// | button     | 14.0 | medium  |  1.25    |             |
/// | caption    | 12.0 | regular |  0.4     |             |
/// | overline   | 10.0 | regular |  1.5     |             |
///



//the pachage type:
//1-layout : contain the screen that have more screen
//2-models : contain the class models
//3-modules : all the deffrent screens 
//4-shared : contain a things that shared to the application // have a:
// - components  //  network : have a local and remote
