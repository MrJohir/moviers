import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviers/features/Personalization/ui/screens/Personalization.dart';
import 'package:moviers/features/auth/ui/screens/login_screen.dart';
import 'package:video_player/video_player.dart';
import '../../controller/auth_controller.dart';
import '../widget/splash_appbar.dart';

class OnBoardingOne extends StatelessWidget {
  OnBoardingOne({super.key});
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
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
                    var item = controller.movieData[index];
                    if (item["type"] == "image") {
                      return ClipRRect(
                        child: Image.asset(item["path"], fit: BoxFit.fitWidth),
                      );
                    } else {
                      return VideoThumbnailWidget(videoUrl: item["path"]);
                    }
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Obx(() {
                  var item = controller.movieData[controller.currentPage.value];
                  return Column(
                    children: [
                      Text(
                        item["title"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 80),
                        child: Text(
                          item["subtitle"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff9E9E9E),
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          controller.movieData.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 8,
                            height: 4,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
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
                      SizedBox(height: 45),
                      if (controller.currentPage.value == 1)
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(

                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(
                                  0xffFFFFFF,
                                ).withValues(alpha: 0.2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                side: BorderSide.none,
                              ),
                              onPressed: () {
                                Get.offAll(()=>Personalization());
                              },
                              child: const Text(
                                "Get Started",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff298CFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                side: BorderSide.none,
                              ),
                              onPressed: () {
                                Get.offAll(()=>LoginScreen());
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoThumbnailWidget extends StatefulWidget {
  final String videoUrl;
  const VideoThumbnailWidget({super.key, required this.videoUrl});

  @override
  State<VideoThumbnailWidget> createState() => _VideoThumbnailWidgetState();
}

class _VideoThumbnailWidgetState extends State<VideoThumbnailWidget> {
  late VideoPlayerController _videoController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  void _togglePlay() {
    setState(() {
      if (_videoController.value.isPlaying) {
        _videoController.pause();
        _isPlaying = false;
      } else {
        _videoController.play();
        _isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: GestureDetector(
        onTap: _togglePlay,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio:
                  _videoController.value.isInitialized
                      ? _videoController.value.aspectRatio
                      : 16 / 9,
              child:
                  _videoController.value.isInitialized
                      ? VideoPlayer(_videoController)
                      : const Center(child: CircularProgressIndicator()),
            ),
            if (!_isPlaying)
              const Icon(Icons.play_circle_fill, size: 64, color: Colors.white70),
          ],
        ),
      ),
    );
  }
}
