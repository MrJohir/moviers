import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ui/screens/on_boarding_one.dart';

class AuthController extends GetxController {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPassWordController = TextEditingController();
  final TextEditingController confirmPassWordController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController otpController = TextEditingController();



  RxBool isEmailLogin = false.obs;
  RxBool isEmailRegister = false.obs;
  RxBool isOtp = false.obs;
  RxInt currentPage = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    // moveNextScreen();
    pageController = PageController();
    // startAutoPlay();

  }
  void onEmailChanged(String value) {
    isEmailLogin.value = value.isNotEmpty;
  }

  void onEmailRegister(String value){
    isEmailRegister.value = value.isNotEmpty;
  }

  void onSentOtp(String value){
    isOtp.value = value.isNotEmpty;
  }

  Future<void> moveNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    await Get.off(()=>OnBoardingOne());
  }


  void startAutoPlay() {
    Future.delayed(Duration(seconds: 5), () {
      if (currentPage.value < 1) {
        currentPage.value++;
      } else {
        currentPage.value = 0;
      }
      pageController.animateToPage(
        currentPage.value,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      // startAutoPlay();
    });
  }

  final List<Map<String, dynamic>> movieData = [
    // {
    //   'type': 'asset',
    //   'image': ImagePath.onBoardingImage,
    //   'title': 'Splash Movie'
    // },
    {
      'image':
      'https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?w=300&h=400&fit=crop',
      'title': 'Doctor Strange',
    },

  ];

  void onPageChanged(int page) {
    currentPage.value = page;
  }

  // void skipIntro() {
  //   Get.snackbar(
  //     'Navigation',
  //     'Going to main app...',
  //     backgroundColor: Colors.blue.withOpacity(0.8),
  //     colorText: Colors.white,
  //   );
  // }

  // @override
  // void onClose() {
  //   pageController.dispose();
  //   super.onClose();
  // }


}