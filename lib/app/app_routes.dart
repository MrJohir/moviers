import 'package:get/get.dart';
import 'package:moviers/features/auth/ui/screens/login_screen.dart';
import 'package:moviers/features/auth/ui/screens/on_boarding_one.dart';
import '../features/auth/ui/screens/splashScreen.dart';

class AppRoute {

  static String splashScreens = '/splashScreens';
  static String onBoardingOne = '/onBoardingOne';
  static String loginScreen = '/loginScreen';

  static String getSplashScreens() => splashScreens;
  static String getOnBoardingOne() => onBoardingOne;
  static String getLoginScreen() => loginScreen;


  static List<GetPage> routes =[
    GetPage(name: splashScreens, page: ()=> Splashscreen()),
    GetPage(name: onBoardingOne, page: ()=> OnBoardingOne()),
    GetPage(name: loginScreen, page: ()=> LoginScreen()),
  ];
}