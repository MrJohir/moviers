import 'package:get/get.dart';
import 'package:moviers/features/auth/ui/screens/login_screen.dart';
import '../features/Personalization/ui/screens/Personalization.dart';
import '../features/auth/ui/screens/on_boarding_one.dart';
import '../features/auth/ui/screens/otp_verification.dart';
import '../features/auth/ui/screens/register_screen.dart';
import '../features/auth/ui/screens/splashScreen.dart';
import '../features/bottom_nav_bar/ui/screens/bottom_nav_bar_screen.dart';
import '../features/home/ui/screens/home_screen.dart';
import '../features/movie_details/ui/screens/movie_details_screen.dart';
import '../features/preview_section/ui/screens/top_charts.dart';
import '../features/series_details/ui/screens/series_details_screen.dart';

class AppRoute {

  static String splashScreens = '/splashScreens';
  static String onBoardingOne = '/onBoardingOne';
  static String loginScreen = '/loginScreen';
  static String otpVerification = '/otpVerification';
  static String registerScreen = '/registerScreen';
  static String personalization = '/personalization';
  static String bottomNavbarScreen = '/bottomNavbarScreen';
  static String homeScreen = '/homeScreen';
  static String topChartsScreen = '/topChartsScreen';
  static String movieDetailsScreen = '/movieDetailsScreen';
  static String seriesDetailsScreen = '/seriesDetailsScreen';

  static String getSplashScreens() => splashScreens;
  static String getOnBoardingOne() => onBoardingOne;
  static String getLoginScreen() => loginScreen;
  static String getOtpVerification()=> otpVerification;
  static String getRegisterScreen()=> registerScreen;
  static String getPersonalization()=> personalization;
  static String getBottomNavbarScreen()=> bottomNavbarScreen;
  static String getHomeScreen()=> homeScreen;
  static String getTopChartsScreen()=> topChartsScreen;
  static String getMovieDetailsScreen()=> movieDetailsScreen;
  static String getSeriesDetailsScreen()=> seriesDetailsScreen;


  static List<GetPage> routes =[
    GetPage(name: splashScreens, page: ()=> Splashscreen()),
    GetPage(name: onBoardingOne, page: ()=> OnBoardingOne()),
    GetPage(name: loginScreen, page: ()=> LoginScreen()),
    GetPage(name: otpVerification, page: ()=> OtpVerification()),
    GetPage(name: registerScreen, page: ()=> RegisterScreen()),
    GetPage(name: personalization, page: ()=>Personalization()),
    GetPage(name: bottomNavbarScreen, page: ()=>BottomNavbarScreen()),
    GetPage(name: homeScreen, page: ()=>HomeScreen()),
    GetPage(name: topChartsScreen, page: ()=>TopChartsScreen()),
    GetPage(name: movieDetailsScreen, page: ()=>MovieDetailsScreen()),
    GetPage(name: seriesDetailsScreen, page: ()=>SeriesDetailsScreen()),

  ];
}