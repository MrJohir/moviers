import 'package:get/get.dart';

class SeriesDetailsController extends GetxController {
  final List<Map<String, dynamic>> season2Episodes = [
    {
      'title': 'Episode 4: Revenge',
      'thumbnail': 'https://images.unsplash.com/photo-1574375927938-d5a98e8ffe85?w=300&h=200&fit=crop',
      'duration': '45 min',
    },
    {
      'title': 'Episode 5: The Jedi',
      'thumbnail': 'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=300&h=200&fit=crop',
      'duration': '42 min',
    },
    {
      'title': 'Episode 6: The Tragedy',
      'thumbnail': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&h=200&fit=crop',
      'duration': '38 min',
    },
    {
      'title': 'Episode 7: The Believer',
      'thumbnail': 'https://images.unsplash.com/photo-1446776876064-aeb491e6b946?w=300&h=200&fit=crop',
      'duration': '44 min',
    },
  ];

  var currentEpisode = 'S2E4'.obs;
  var watchProgress = 0.7.obs;

  final List<Map<String, dynamic>> season1Episodes = [
    {
      'title': 'Episode 1: The Beginning',
      'thumbnail': 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    },
    {
      'title': 'Episode 2: Meet the Heroes',
      'thumbnail': 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    },
    {
      'title': 'Episode 3: Redemption',
      'thumbnail': 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    },
    {
      'title': 'Episode 4: The Reckoning',
      'thumbnail': 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    },
    {
      'title': 'Episode 5: The Passenger',
      'thumbnail': 'https://images.unsplash.com/photo-1534447677768-be436bb09401?w=150&h=100&fit=crop',
    },
    {
      'title': 'Episode 6: The Tragedy',
      'thumbnail': 'https://images.unsplash.com/photo-1419242902214-272b3f66ee7a?w=150&h=100&fit=crop',
    },
  ];
}