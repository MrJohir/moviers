// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:moviers/core/utils/image_path.dart';
// import 'package:video_player/video_player.dart';
//
// // Controller class
// class MovierScreenController extends GetxController {
//   var currentIndex = 0.obs;
//   VideoPlayerController? videoController;
//   var isVideoInitialized = false.obs;
//
//   // Sample movie images
//   final List movieImages = [
//     ImagePath.warsStory,
//     ImagePath.series,
//     ImagePath.dinosor,
//   ];
//
//   // Sample video URL
//   final String videoUrl =
//       'https://www.google.com/search?q=movie+trailers+shorts&sca_esv=e018978d43334d92&udm=7&biw=1366&bih=607&sxsrf=AE3TifMmQ1YHhSH3IvtLM-TZBE2wMucjOw%3A1755410291252&ei=c2-haI2SD_SOseMP49iE8AU&ved=0ahUKEwjNl-H2lJGPAxV0R2wGHWMsAV4Q4dUDCBA&uact=5&oq=movie+trailers+shorts&gs_lp=EhZnd3Mtd2l6LW1vZGVsZXNzLXZpZGVvIhVtb3ZpZSB0cmFpbGVycyBzaG9ydHMyBhAAGBYYHjILEAAYgAQYhgMYigUyCxAAGIAEGIYDGIoFMgUQABjvBTIFEAAY7wVI2i9QvAJYhyZwAngBkAEAmAHgAaAB0wqqAQUwLjcuMbgBA8gBAPgBAZgCCqAC0QvCAgoQABiwAxjWBBhHwgIKEAAYgAQYQxiKBcICBRAAGIAEwgILEAAYgAQYkQIYigXCAgUQIRifBcICCBAAGBYYChgemAMAiAYBkAYIkgcFMi41LjOgB54rsgcFMC41LjO4B70LwgcHMi00LjUuMcgHag&sclient=gws-wiz-modeless-video#fpstate=ive&vld=cid:b8adefb2,vid:YXocoNyFeOY,st:0';
//
//   @override
//   void onInit() {
//     super.onInit();
//     initializeVideo();
//   }
//
//   void initializeVideo() {
//     videoController = VideoPlayerController.network(videoUrl);
//     videoController!.initialize().then((_) {
//       isVideoInitialized.value = true;
//     });
//   }
//
//   void swapContent() {
//     currentIndex.value = currentIndex.value == 0 ? 1 : 0;
//     if (currentIndex.value == 1 && videoController != null) {
//       videoController!.play();
//     } else if (videoController != null) {
//       videoController!.pause();
//     }
//   }
//
//   @override
//   void onClose() {
//     videoController?.dispose();
//     super.onClose();
//   }
// }
//
// // Main Screen Widget
// class MovierScreen extends StatelessWidget {
//   const MovierScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(MovierScreenController());
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Header
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Text(
//                         'M',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Container(
//                         width: 8,
//                         height: 8,
//                         margin: EdgeInsets.symmetric(horizontal: 2),
//                         decoration: BoxDecoration(
//                           color: Colors.red,
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                       Text(
//                         'viers',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       'Skip',
//                       style: TextStyle(color: Colors.grey, fontSize: 16),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Content Area (Images or Video)
//                   GestureDetector(
//                     onTap: controller.swapContent,
//                     child: Container(
//                       height: 400,
//                       margin: EdgeInsets.symmetric(horizontal: 20),
//                       child: Obx(() {
//                         if (controller.currentIndex.value == 0) {
//                           // Show 3 images
//                           return Row(
//                             children: [
//                               // Left image
//                               Expanded(
//                                 child: Container(
//                                   margin: EdgeInsets.only(right: 8),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(12),
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                         controller.movieImages[0],
//                                       ),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               // Center image (larger)
//                               Expanded(
//                                 flex: 2,
//                                 child: Container(
//                                   margin: EdgeInsets.symmetric(horizontal: 8),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(12),
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                         controller.movieImages[1],
//                                       ),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               // Right image
//                               Expanded(
//                                 child: Container(
//                                   height: 300,
//                                   margin: EdgeInsets.only(left: 8),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(12),
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                         controller.movieImages[2],
//                                       ),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           );
//                         } else {
//                           // Show video
//                           return Obx(() {
//                             if (controller.isVideoInitialized.value &&
//                                 controller.videoController != null) {
//                               return Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(12),
//                                   child: AspectRatio(
//                                     aspectRatio:
//                                         controller
//                                             .videoController!
//                                             .value
//                                             .aspectRatio,
//                                     child: VideoPlayer(
//                                       controller.videoController!,
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             } else {
//                               return Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   color: Colors.grey[900],
//                                 ),
//                                 child: Center(
//                                   child: CircularProgressIndicator(
//                                     color: Colors.red,
//                                   ),
//                                 ),
//                               );
//                             }
//                           });
//                         }
//                       }),
//                     ),
//                   ),
//
//                   SizedBox(height: 40),
//
//                   // Title and Description
//                   Obx(() {
//                     if (controller.currentIndex.value == 0) {
//                       return Column(
//                         children: [
//                           Text(
//                             'Watch Your Best Movies in One App',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           SizedBox(height: 12),
//                           Text(
//                             'Unlimited access to millions of new and\nquality movies just for you',
//                             style: TextStyle(
//                               color: Colors.grey[400],
//                               fontSize: 16,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       );
//                     } else {
//                       return Column(
//                         children: [
//                           Text(
//                             'Best Service Features',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           SizedBox(height: 12),
//                           Text(
//                             'The features we provide will guarantee the\nbest quality for your streaming',
//                             style: TextStyle(
//                               color: Colors.grey[400],
//                               fontSize: 16,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       );
//                     }
//                   }),
//
//                   SizedBox(height: 40),
//
//                   // Dots Indicator
//                   Obx(
//                     () => Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 8,
//                           height: 8,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color:
//                                 controller.currentIndex.value == 0
//                                     ? Colors.red
//                                     : Colors.grey[600],
//                           ),
//                         ),
//                         SizedBox(width: 8),
//                         Container(
//                           width: 8,
//                           height: 8,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color:
//                                 controller.currentIndex.value == 1
//                                     ? Colors.red
//                                     : Colors.grey[600],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // Bottom Buttons
//             Obx(() {
//               if (controller.currentIndex.value == 1) {
//                 return Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           height: 50,
//                           child: ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.grey[800],
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             child: Text(
//                               'Get Started',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 12),
//                       Expanded(
//                         child: Container(
//                           height: 50,
//                           child: ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             child: Text(
//                               'Login',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               } else {
//                 return SizedBox(height: 90);
//               }
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // App class
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Moviers App',
//       theme: ThemeData(primarySwatch: Colors.red),
//       home: MovierScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// void main() {
//   runApp(MyApp());
// }
