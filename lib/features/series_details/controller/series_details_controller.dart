import 'package:get/get.dart';

class MandalorianController extends GetxController {
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

  // Current watching progress
  var currentEpisode = 'S2E4'.obs;
  var watchProgress = 0.7.obs; // 70% watched

  // Continue watching method
  void continueWatching() {
    print("Continuing to watch ${currentEpisode.value}");
    // Add your navigation logic here
  }

  // View all episodes method
  void viewAllEpisodes() {
    print("Viewing all episodes");
    // Add your navigation logic here
  }

  // Play specific episode
  void playEpisode(Map<String, dynamic> episode) {
    print("Playing: ${episode['title']}");
    // Add your play logic here
  }

  // Add to watchlist
  void addToWatchlist() {
    print("Added to watchlist");
    // Add your watchlist logic here
  }
}