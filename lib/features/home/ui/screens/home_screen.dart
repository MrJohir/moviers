import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviers/features/preview_section/ui/screens/top_charts.dart';
import '../../../../core/utils/image_path.dart';
import '../../../movie_details/ui/screens/movie_details_screen.dart';
import '../../controller/home_controller.dart';
import '../widget/popular_star.dart';
import '../widget/top_charts_item.dart';
import '../widget/weekly_highlight_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0A0A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            ImagePath.warsStory,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
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
                                stops: [0.0, 0.3, 0.7, 1.0],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 24,
                          child: Text(
                            'Rogue One: A Star Wars\nStory',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 16,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Color(0xffFFBB38),
                            ),
                            SizedBox(width: 6),
                            Text(
                              '8.4',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffFFBB38),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Text(
                                '2016',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff9E9E9E),
                                ),
                              ),
                            ),
                            Text(
                              '1h 54m',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff9E9E9E),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Text(
                                'Sci-Fi',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff9E9E9E),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff298CFF),
                                  minimumSize: Size(double.infinity, 48),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                onPressed:(){
                                  Get.to(()=>MovieDetailsScreen());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.play_circle,
                                      size: 20,
                                      color: Color(0xffFFFFFF),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Watch Movie',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffFFFFFF),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            GestureDetector(
                              onTap: (){},
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF).withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Icon(
                                  Icons.bookmark_border,
                                  size: 24,
                                  color: Color(0xffC2C2C2),
                                ),
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
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff151515), Color(0xff0A0A0A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Top Charts',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.to(()=>TopChartsScreen());
                          },
                          child: Text(
                            'View All',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffC2C2C2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 230,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.movies.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1 / 1.2,
                        ),
                        itemBuilder: (context, index) {
                          return TopChartsItem(movie: controller.movies[index]);
                        },
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      'Weekly Highlight',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 240,
                      child: PageView.builder(
                        controller: controller.weeklyPageController,
                        itemCount: controller.weeklyMovies.length,
                        onPageChanged: controller.onWeeklyPageChanged,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: WeeklyHighlightItem(movie: controller.weeklyMovies[index]),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 12),
                    Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(controller.weeklyMovies.length, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: controller.currentWeeklyIndex.value == index
                                ? Color(0xff298CFF)
                                : Color(0xff9E9E9E).withValues(alpha: 0.5),
                          ),
                        );
                      }),
                    )),
                    SizedBox(height: 8),
                    Divider(height: 8, color: Color(0xff000000)),
                    SizedBox(height: 10),
                    Text(
                      'Popular Star',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 200,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.actors.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10,
                          childAspectRatio: 4 / 2,
                        ),
                        itemBuilder: (context, index) {
                          return PopularStar(actor: controller.actors[index]);
                        },
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




