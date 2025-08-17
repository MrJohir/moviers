import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/image_path.dart';

class AuthController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPassWordController =
      TextEditingController();
  final TextEditingController confirmPassWordController =
      TextEditingController();
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
    pageController = PageController();
  }

  void onEmailChanged(String value) {
    isEmailLogin.value = value.isNotEmpty;
  }

  void onEmailRegister(String value) {
    isEmailRegister.value = value.isNotEmpty;
  }

  void onSentOtp(String value) {
    isOtp.value = value.isNotEmpty;
  }

  final List movieData = [
    {
      "type": "image",
      "path": ImagePath.onboarding,
      "title": "Watch Your Best Movies in One App",
      "subtitle":
          "Unlimited access to millions of new and quality movies just for you",
    },
    {
      "type": "video",
      "path":
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      "title": "Best Service Features",
      "subtitle":
          "The features we provide will guarantee the best quality for your streaming",
    },
  ];

  void onPageChanged(int page) {
    currentPage.value = page;
  }

  // @override
  // void onClose() {
  //   pageController.dispose();
  //   super.onClose();
  // }
}
