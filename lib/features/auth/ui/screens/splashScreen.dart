import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviers/core/utils/image_path.dart';
import '../../controller/auth_controller.dart';

class Splashscreen extends StatelessWidget {
   Splashscreen({super.key});
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: double.infinity,
            child: Image.asset(ImagePath.splash, fit: BoxFit.cover),
          ),
          Positioned(
            bottom: 20,
            child: Row(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Version 2.04.3.1',
                  style: TextStyle(
                    color: Color(0xff757575),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
