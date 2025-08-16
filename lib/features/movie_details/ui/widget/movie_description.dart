import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviers/features/auth/ui/widget/coustom_button.dart';
import 'package:moviers/features/movie_details/ui/widget/subscribe_card.dart';
import '../../../../core/utils/image_path.dart';
import '../../../movie_details/controller/movie_details_controller.dart';
import '../../../series_details/ui/screens/series_details_screen.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({super.key, required this.controller});

  final MovieDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.isDescriptionExpanded.value
                      ? controller.movieData['fullDescription']
                      : controller.movieData['description'],
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Color(0xffC2C2C2),
                  ),
                ),
                GestureDetector(
                  onTap: controller.onMorePressed,
                  child: Text(
                    controller.isDescriptionExpanded.value ? 'Less' : 'More',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff298CFF),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 24),
          Text(
            'Trailers',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xffFFFFFF),
            ),
          ),
          SizedBox(height: 16),

          SizedBox(
            height: 190,
            width: double.infinity,
            child: GestureDetector(
              // onTap: () => controller.onTrailerPressed(index),
              child: Container(
                // width: 150,
                // margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            image: AssetImage(ImagePath.warsStory),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black.withValues(alpha: 0.3),
                          ),
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.all(8),
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff298CFF),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    showSubscriptionBottomSheet();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_circle_fill,
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Watch Movie',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16),
              Obx(
                () => GestureDetector(
                  onTap: controller.onBookmarkPressed,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xff1A1A1A),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xff333333), width: 1),
                    ),
                    child: Icon(
                      controller.isBookmarked.value
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color:
                          controller.isBookmarked.value
                              ? Color(0xff298CFF)
                              : Color(0xffC2C2C2),
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  void showSubscriptionBottomSheet() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xff1A1A1A),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Subscribe to Premium Plan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Get the premium plan and get unlimited access\ncontent for watching movies.',
              style: TextStyle(
                color: Color(0xffB0B0B0),
                fontSize: 14,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),

            SubscribeCard(controller: controller),
            _buildFeatureItem(
              icon: Icons.play_circle_outline,
              title: 'Unlimited Content',
              subtitle: 'Watching unlimited content in one apps',
            ),
            _buildFeatureItem(
              icon: Icons.people_outline,
              title: 'Sharing Accounts',
              subtitle: 'Enjoy movies with your beloved friends or family',
            ),
            _buildFeatureItem(
              icon: Icons.hd,
              title: 'FHD Quality',
              subtitle: 'The best service for you with best quality player',
            ),

            Padding(
              padding: const EdgeInsets.only(top: 58, bottom: 16),
              child: CoustomaButton(
                onPressed: () {
                  Get.to(()=>MandalorianPage());
                },
                text: 'Start your 14-days trial',
                style: TextStyle(fontSize: 16, color: Color(0xffFFFFFF)),
                backgroundColor: Color(0xff298CFF),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      isDismissible: true,
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF).withValues(alpha: .12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Color(0xffCDCDCD), size: 20),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Color(0xff9E9E9E), fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
