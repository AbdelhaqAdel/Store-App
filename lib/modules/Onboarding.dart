import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../network/local/SharedPreferences.dart';
import '../shared/commponent.dart';
import 'login/loginscreen.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var pagecontroler = PageController();

  List<Map> boarding = [
    {
      'image': 'assets/image/wings.png',
      'title': 'welcome 1',
      'description': 'description 1',
    },
    {
      'image': 'assets/image/wings.png',
      'title': 'welcome 2',
      'description': 'description 2',
    },
    {
      'image': 'assets/image/wings.png',
      'title': 'welcome 3',
      'description': 'description 3',
    },
  ];

  bool islast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                CachHelper.saveData(key: 'onboarding', value: true).then((value){
                  if(value==true){
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                            (route) => false);
                  }
                });

              },
              child: Text('Skip')),
        ],


      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: pagecontroler,
                itemBuilder: (context, index) =>
                    BuildItemOnboarding(model: boarding[index]),
                itemCount: boarding.length,
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    islast = true;
                  } else {
                    islast = false;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: pagecontroler, // PageController
                    count: 3,
                    effect: ExpandingDotsEffect(
                      spacing: 5.0,
                      dotWidth: 10.0,
                      dotHeight: 10.0,
                      expansionFactor: 4,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.cyan,
                    ), // your preferred effect
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (islast) {
                        CachHelper.saveData(key: 'onboarding', value: true).then((value){
                          if(value==true){
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                                    (route) => false);
                          }
                        });
                      } else {
                        pagecontroler.nextPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
