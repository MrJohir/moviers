import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/movie_details_controller.dart';
import '../widget/movie_description.dart';

class MovieDetailsScreen extends StatelessWidget {
  MovieDetailsScreen({super.key});
  final MovieDetailsController controller = Get.put(MovieDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0A0A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(controller.movieData['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Color(0xff0A0A0A).withValues(alpha: 0.8),
                          Color(0xff0A0A0A),
                        ],
                        stops: [0.0, 0.4, 0.7, 1.0],
                      ),
                    ),
                  ),

                  // Top navigation
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 18,
                    left: 10,

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CircleAvatar(
                        backgroundColor: Color(
                          0xffFFFFFF,
                        ).withValues(alpha: 0.2),
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 24,
                    right: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.movieData['title'],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Color(0xffFFBB38),
                            ),
                            SizedBox(width: 6),
                            Text(
                              controller.movieData['rating'],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffFFBB38),
                              ),
                            ),
                            SizedBox(width: 16),
                            Text(
                              controller.movieData['year'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff9E9E9E),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Text(
                                controller.movieData['duration'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff9E9E9E),
                                ),
                              ),
                            ),

                            Text(
                              controller.movieData['genre'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff9E9E9E),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            MovieDescription(controller: controller),
          ],
        ),
      ),
    );
  }
}
