import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller.dart';
import '../widget/splash_appbar.dart';

class OnBoardingOne extends StatelessWidget {
  OnBoardingOne({super.key});
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0A0A),
      appBar: SplashAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 28),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: 500,
                child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                  itemCount: controller.movieData.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            controller.movieData[0],
                            fit: BoxFit.fitWidth,
                          ),
                          Image.asset(
                            controller.movieData[1],
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    Text(
                      'Watch Your Best Movies in One App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 80),
                      child: Text(
                        'Unlimited access to millions of new and quality movies just for you',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ),

                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          controller.movieData.length,
                          (index) => AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            width:
                                controller.currentPage.value == index ? 8 : 8,
                            height: 4,
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color:
                                  controller.currentPage.value == index
                                      ? Colors.blue
                                      : Colors.grey[600],
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
