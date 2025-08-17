import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviers/core/utils/image_path.dart';
import '../../controller/series_details_controller.dart';
import '../widget/movie_season.dart';
import '../widget/movie_series_item.dart';

class SeriesDetailsScreen extends StatelessWidget {
  SeriesDetailsScreen({super.key});

  final SeriesDetailsController controller = Get.put(SeriesDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0A0A),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0xff0A0A0A).withValues(alpha: 0.8),
                    Color(0xff0A0A0A),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: Image.asset(
                      ImagePath.series,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Color(0xff1A1A1A),
                          child: Center(
                            child: Icon(
                              Icons.movie,
                              size: 80,
                              color: Color(0xff666666),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 18,
                    left: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CircleAvatar(
                        backgroundColor: Color(
                          0xffFFFFFF,
                        ).withValues(alpha: 0.4),
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
                    bottom: 0,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The Mandalorian',
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 16),
                            SizedBox(width: 6),
                            Text(
                              '8.8',
                              style: TextStyle(
                                color: Color(0xffFFBB38),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Text(
                                '2019',
                                style: TextStyle(
                                  color: Color(0xff9E9E9E),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Text(
                              '2 Season',
                              style: TextStyle(
                                color: Color(0xff9E9E9E),
                                fontSize: 14,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Text(
                                '18 Episode',
                                style: TextStyle(
                                  color: Color(0xff9E9E9E),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Text(
                              'Action',
                              style: TextStyle(
                                color: Color(0xff9E9E9E),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            'After the collapse of the Galactic Empire, chaos reigned. A reclusive Mandalorian seeks to explore the outer regions, earning his living as a bounty hunter.',
                            style: TextStyle(
                              color: Color(0xffC2C2C2),
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Season 1',
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showEpisodesBottomSheet();
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: Color(0xffC2C2C2),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  MovieSeriesItem(controller: controller),
                  Obx(
                    () => SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff2196F3),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        icon: Icon(
                          Icons.play_arrow,
                          color: Color(0xffFFFFFF),
                          size: 20,
                        ),
                        label: Text(
                          'Continue Watch ${controller.currentEpisode.value}',
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showEpisodesBottomSheet() {
    Get.bottomSheet(
      Container(
        height: Get.height * 0.85,
        decoration: BoxDecoration(
          color: Color(0xff1A1A1A),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: MovieSeason(controller: controller),
      ),
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
    );
  }
}
