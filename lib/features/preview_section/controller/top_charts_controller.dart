import 'package:get/get.dart';
import '../../../core/utils/image_path.dart';

class TopChartsController extends GetxController {
  final List<Map<String, String>> topChartMovies = [
    {
      'title': 'Legends',
      'rating': '8.4',
      'year': '2016',
      'duration': '1h 54m',
      'image': ImagePath.legends,
    },
    {
      'title': 'The Good Dinosaur',
      'rating': '8.4',
      'year': '2016',
      'duration': '1h 54m',
      'image': ImagePath.dinosor,
    },
    {
      'title': 'Soul',
      'rating': '8.4',
      'year': '2020',
      'duration': '1h 40m',
      'image': ImagePath.soul,
    },
    {
      'title': 'Brave',
      'rating': '8.1',
      'year': '2012',
      'duration': '1h 33m',
      'image': ImagePath.brave,
    },
    {
      'title': 'Up',
      'rating': '8.3',
      'year': '2009',
      'duration': '1h 36m',
      'image': ImagePath.warsStory,
    },
    {
      'title': 'Inside Out',
      'rating': '8.2',
      'year': '2015',
      'duration': '1h 35m',
      'image': ImagePath.dune,
    },
  ];
}