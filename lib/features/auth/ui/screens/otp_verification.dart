import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviers/features/auth/controller/auth_controller.dart';
import 'package:moviers/features/auth/ui/widget/terms_condition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../Personalization/ui/screens/Personalization.dart';
import '../widget/auth_appbar.dart';
import '../widget/coustom_button.dart';

class OtpVerification extends StatelessWidget {
  OtpVerification({super.key});
  final AuthController controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(text: 'OTP Verification'),
      backgroundColor: Color(0xff0A0A0A),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                'Code is sent to * exemple@gmil.com *',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffFFFFFF),
                ),
              ),
              buildPinCodeTextField(context),
              TermsAndCondition(),
              SizedBox(height: 80),
              Obx(
                () => CoustomaButton(
                  onPressed:
                      controller.isOtp.value
                          ? () {
                            Get.to(() => Personalization());
                          }
                          : null,
                  text: 'Verify',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color:
                        controller.isOtp.value
                            ? Colors.white
                            : Color(0xff757575),
                  ),
                  backgroundColor:
                      controller.isOtp.value
                          ? Color(0xff298CFF)
                          : Color(0xffFFFFFF).withValues(alpha: 0.12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPinCodeTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: PinCodeTextField(
        onChanged: controller.onSentOtp,
        length: 4,
        obscureText: false,
        keyboardType: TextInputType.number,
        animationType: AnimationType.fade,
        textStyle: TextStyle(color: Colors.white),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(6),
          fieldHeight: 48,
          fieldWidth: 48,
          activeColor: Color(0xff757575),
          inactiveColor: Color(0xff757575),
          selectedColor: Color(0xff298CFF),
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        enableActiveFill: false,
        controller: controller.otpController,
        appContext: context,
      ),
    );
  }
}
