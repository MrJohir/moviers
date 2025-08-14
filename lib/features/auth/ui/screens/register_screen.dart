import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviers/features/auth/controller/auth_controller.dart';
import 'package:moviers/features/auth/ui/widget/auth_appbar.dart';
import 'package:moviers/features/auth/ui/widget/coustomar_textField.dart';

import '../../../../core/utils/image_path.dart';
import '../widget/coustom_button.dart';
import '../widget/terms_condition.dart';
import 'otp_verification.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final AuthController controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(text: 'Register'),
      backgroundColor: Color(0xff0A0A0A),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Text(
                  'Create New Account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
              CoustomTextField(
                text: 'Email',
                prefixIcon: Icon(Icons.email, weight: 16),
                controller: controller.registerEmailController,
                onChanged: controller.onEmailRegister,
              ),

              CoustomTextField(
                text: 'Password',
                prefixIcon: Icon(Icons.lock, weight: 16),
                controller: controller.registerPassWordController,
              ),

              CoustomTextField(
                text: 'Confirm Password',
                prefixIcon: Icon(Icons.lock, weight: 16),
                controller: controller.confirmPassWordController,
              ),

              CoustomTextField(
                text: 'DD / MM / YYYY',
                prefixIcon: Icon(Icons.calendar_month, weight: 16),
                controller: controller.dateController,
              ),

              Obx(
                () => CoustomaButton(
                  onPressed: controller.isEmailRegister.value ? () {
                    Get.to(()=> OtpVerification());
                  } : null,
                  text: 'Create Account',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color:
                        controller.isEmailRegister.value
                            ? Colors.white
                            : Color(0xff757575),
                  ),
                  backgroundColor:
                      controller.isEmailRegister.value
                          ? Color(0xff298CFF)
                          : Color(0xffFFFFFF).withValues(alpha: 0.12),
                ),
              ),

              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'or',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffC2C2C2),
                    ),
                  ),
                ],
              ),
              CoustomaButton(
                image: ImagePath.appleLogo,
                text: 'Register with Apple',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff0A0A0A),
                ),

                backgroundColor: Color(0xffFFFFFF),
              ),

              CoustomaButton(
                image: ImagePath.googleLogo,
                text: 'Register with Google',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffFFFFFF),
                ),

                backgroundColor: Color(0xff0A0A0A),
                borderColor: Color(0xffFFFFFF).withValues(alpha: 0.24),
              ),

              TermsAndCondition(),
            ],
          ),
        ),
      ),
    );
  }
}

