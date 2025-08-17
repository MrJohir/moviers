import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/image_path.dart';
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
    moveNextScreen();
    pageController = PageController();

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


  final List movieData = [

    ImagePath.onboarding,
    ImagePath.onboarding,
  ];

  void onPageChanged(int page) {
    currentPage.value = page;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

}
