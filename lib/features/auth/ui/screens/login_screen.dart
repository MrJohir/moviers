import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviers/core/utils/image_path.dart';
import 'package:moviers/features/Personalization/ui/screens/Personalization.dart';
import 'package:moviers/features/auth/controller/auth_controller.dart';
import 'package:moviers/features/auth/ui/screens/register_screen.dart';
import '../widget/auth_appbar.dart';
import '../widget/coustom_button.dart';
import '../widget/coustomar_textField.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(text: 'Login',),
      backgroundColor: Color(0xff0A0A0A),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Text(
                  'Welcome to Moviers',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),

              CoustomTextField(
                controller: controller.emailController,
                text: 'Email',
                prefixIcon: Icon(
                  Icons.email,
                  weight: 16,
                ),
                onChanged: controller.onEmailChanged,
              ),
              CoustomTextField(
                controller: controller.passWordController,
                text: 'Password',
                prefixIcon: Icon(
                  Icons.lock,
                  weight: 16,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                ],
              ),

              Obx(()=>
                 CoustomaButton(
                  onPressed: controller.isEmailLogin.value ? () {
                    Get.to(()=>Personalization());
                  } : null,
                  text: 'Login',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: controller.isEmailLogin.value? Colors.white : Color(0xff757575),
                  ),
                  backgroundColor:
                      controller.isEmailLogin.value
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
                text: 'Login with Apple',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff0A0A0A),
                ),

                backgroundColor: Color(0xffFFFFFF),
              ),

              CoustomaButton(
                image: ImagePath.googleLogo,
                text: 'Login with Google',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffFFFFFF),
                ),

                backgroundColor: Color(0xff0A0A0A),
                borderColor: Color(0xffFFFFFF).withValues(alpha: 0.24),
              ),
              SizedBox(height: 150),
              // Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        TextSpan(
                          text: ' Sign Up',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff298CFF),
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Get.to(()=> RegisterScreen());
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
