import 'package:get/get.dart';
import '../ui/screens/on_boarding_one.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    moveNextScreen();
  }
  Future<void> moveNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    await Get.offAll(() => OnBoardingOne());
  }
}