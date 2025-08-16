import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviers/core/utils/image_path.dart';

import '../../controller/series_details_controller.dart';

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
                  // Season header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Season 2',
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
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
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.season2Episodes.length,
                      itemBuilder: (context, index) {
                        final episode = controller.season2Episodes[index];
                        return Container(
                          width: 280,
                          margin: EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () => controller.playEpisode(episode),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 160,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          episode['thumbnail'],
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                          errorBuilder: (
                                            context,
                                            error,
                                            stackTrace,
                                          ) {
                                            return Container(
                                              color: Color(0xff1A1A1A),
                                              child: Center(
                                                child: Icon(
                                                  Icons.play_circle_outline,
                                                  size: 40,
                                                  color: Color(0xff666666),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.transparent,
                                                Colors.black.withValues(
                                                  alpha: 0.3,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.black.withValues(
                                                alpha: 0.6,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.play_arrow,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 8,
                                          right: 8,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 6,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.black.withValues(
                                                alpha: 0.8,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              episode['duration'],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Text(
                                    episode['title'],
                                    style: TextStyle(
                                      color: Color(0xffC2C2C2),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  //
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       flex: 8,
                  //       child: ElevatedButton.icon(
                  //         onPressed: controller.continueWatching,
                  //         style: ElevatedButton.styleFrom(
                  //           backgroundColor: Color(0xff2196F3),
                  //           padding: EdgeInsets.symmetric(vertical: 16),
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(8),
                  //           ),
                  //         ),
                  //         icon: Icon(
                  //           Icons.play_arrow,
                  //           color: Colors.white,
                  //           size: 20,
                  //         ),
                  //         label: Text(
                  //           'Continue Watch ${controller.currentEpisode.value}',
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(width: 16),
                  //     Expanded(
                  //       flex: 1,
                  //       child: Obx(
                  //             () => GestureDetector(
                  //           // onTap: controller.onBookmarkPressed,
                  //           child: Container(
                  //             padding: EdgeInsets.all(12),
                  //             decoration: BoxDecoration(
                  //               color: Color(0xff1A1A1A),
                  //               borderRadius: BorderRadius.circular(8),
                  //               border: Border.all(color: Color(0xff333333), width: 1),
                  //             ),
                  //             // child: Icon(
                  //             //   controller.isBookmarked.value
                  //             //       ? Icons.bookmark
                  //             //       : Icons.bookmark_border,
                  //             //   color:
                  //             //   controller.isBookmarked.value
                  //             //       ? Color(0xff298CFF)
                  //             //       : Color(0xffC2C2C2),
                  //             //   size: 24,
                  //             // ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Obx(
                    () => SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: controller.continueWatching,
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
                  //
                  // // Add to watchlist button
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: OutlinedButton.icon(
                  //     onPressed: controller.addToWatchlist,
                  //     style: OutlinedButton.styleFrom(
                  //       side: BorderSide(color: Color(0xff666666)),
                  //       padding: EdgeInsets.symmetric(vertical: 16),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(8),
                  //       ),
                  //     ),
                  //     icon: Icon(
                  //       Icons.bookmark_border,
                  //       color: Colors.white,
                  //       size: 20,
                  //     ),
                  //     label: Text(
                  //       'Add to Watchlist',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'The Mandalorian',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16,bottom: 10),
                child: Text(
                  'Season 1',
                  style: TextStyle(
                    color: Color(0xffB0B0B0),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount:controller. season1Episodes.length,
                  itemBuilder: (context, index) {
                    final episode = controller. season1Episodes[index];
                    return GestureDetector(
                      // onTap: () => playEpisode(episode),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          children: [
                            Container(
                              width: 142,
                              height: 82,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xff2A2A2A),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Stack(
                                  children: [
                                    Image.network(
                                      episode['thumbnail'],
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Container(
                                          color: Color(0xff2A2A2A),
                                          child: Center(
                                            child: Icon(
                                              Icons.play_circle_outline,
                                              size: 30,
                                              color: Color(0xff666666),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black.withValues(alpha: 0.3),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withValues(alpha: 0.6),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    episode['title'],
                                    style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  // SizedBox(height: 4),
                                  // Text(
                                  //   episode['duration'],
                                  //   style: TextStyle(
                                  //     color: Color(0xffB0B0B0),
                                  //     fontSize: 14,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
    );
  }
}
