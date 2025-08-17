// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';
// import 'package:flutter/services.dart';
//
// class VideoPlayerControllerX extends GetxController {
//   Rxn<VideoPlayerController> controller = Rxn<VideoPlayerController>();
//   RxInt currentIndex = 0.obs;
//   RxBool isFullScreen = false.obs;
//
//   final List<Map<String, dynamic>> episodes;
//
//   VideoPlayerControllerX({required this.episodes, required int initialIndex}) {
//     currentIndex.value = initialIndex;
//     _initializeVideo(episodes[initialIndex]['thumbnail']);
//   }
//
//   void _initializeVideo(String url) {
//     controller.value = VideoPlayerController.networkUrl(Uri.parse(url))
//       ..initialize().then((_) {
//         controller.value!.play();
//         update();
//       });
//   }
//
//   void playPause() {
//     if (controller.value!.value.isPlaying) {
//       controller.value!.pause();
//     } else {
//       controller.value!.play();
//     }
//     update();
//   }
//
//   void nextEpisode() {
//     if (currentIndex.value < episodes.length - 1) {
//       currentIndex.value++;
//       controller.value!.dispose();
//       _initializeVideo(episodes[currentIndex.value]['thumbnail']);
//     }
//   }
//
//   void previousEpisode() {
//     if (currentIndex.value > 0) {
//       currentIndex.value--;
//       controller.value!.dispose();
//       _initializeVideo(episodes[currentIndex.value]['thumbnail']);
//     }
//   }
//
//   void toggleFullScreen() {
//     if (isFullScreen.value) {
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.portraitUp,
//         DeviceOrientation.portraitDown,
//       ]);
//     } else {
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight,
//       ]);
//     }
//     isFullScreen.value = !isFullScreen.value;
//   }
//
//   @override
//   void onClose() {
//     controller.value?.dispose();
//     super.onClose();
//   }
// }
