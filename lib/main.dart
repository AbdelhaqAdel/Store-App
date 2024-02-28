import 'package:flutter/material.dart';
import 'modules/shop_App/On_boarding/onBoardingScreen.dart';
import 'network/remote/dio_helper.dart';

void main() {
    DioHelper.init();
   runApp(
      MyApp(
  )
  );
}

class MyApp extends StatelessWidget {
  MyApp();
  @override
  Widget build(BuildContext context) { 
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding (),
    );
  }
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
