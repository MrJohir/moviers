import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/utils/image_path.dart';

class HomeController extends GetxController {
  final RxInt currentWeeklyIndex = 0.obs;
  final PageController weeklyPageController = PageController();
  final List<Map<String, String>> weeklyMovies = [
    {
      'title': 'Suicide Squad',
      'rating': '7.6',
      'year': '2016',
      'duration': '1h 24m',
      'genre': 'Sci-Fi',
      'time': '01:14',
      'image': ImagePath.suicide,
    },
    {
      'title': 'The Batman',
      'rating': '8.2',
      'year': '2022',
      'duration': '2h 56m',
      'genre': 'Action',
      'time': '02:15',
      'image': ImagePath.warsStory,
    },
    {
      'title': 'Doctor Strange',
      'rating': '7.3',
      'year': '2022',
      'duration': '2h 6m',
      'genre': 'Fantasy',
      'time': '01:45',
      'image': ImagePath.suicide,
    },
  ];

  final List<Map<String, String>> movies = [
    {
      'title': 'Dune',
      'rating': '8.9',
      'year': '2021',
      'duration': '2h 35m',
      'genre': 'Action',
      'image': ImagePath.dune,
    },
    {
      'title': 'Shang-Chi',
      'rating': '7.8',
      'year': '2021',
      'duration': '2h 12m',
      'genre': 'Action',
      'image': ImagePath.warsStory,
    },
    {
      'title': 'Spider-Man',
      'rating': '8.2',
      'year': '2021',
      'duration': '2h 28m',
      'genre': 'Action',
      'image': ImagePath.warsStory,
    },
  ];

  final List<Map<String, String>> actors = [
    {'name': 'Chris Evans', 'image': ImagePath.chris},
    {'name': 'Robert Downey', 'image': ImagePath.robert},
    {'name': 'Emma Watson', 'image': ImagePath.emma},
    {'name': 'Scarlett Johansson', 'image': ImagePath.chris},
  ];
  void onWeeklyPageChanged(int index) {
    currentWeeklyIndex.value = index;
  }

  @override
  void onClose() {
    weeklyPageController.dispose();
    super.onClose();
  }
}