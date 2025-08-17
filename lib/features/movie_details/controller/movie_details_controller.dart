import 'package:get/get.dart';
import '../../../core/utils/image_path.dart';

class MovieDetailsController extends GetxController {
  final RxBool isDescriptionExpanded = false.obs;
  final RxBool isBookmarked = false.obs;

  final Map<String, dynamic> movieData = {
    'title': 'Rogue One: A Star Wars\nStory',
    'rating': '8.4',
    'year': '2016',
    'duration': '1h 54m',
    'genre': 'Sci-Fi',
    'description':
        'A Star Wars Story itself focuses on the Rebel Alliance who must Jyn Erso (Felicity Jones) after the formation of the Galactic earning its livir...',
    'fullDescription':
        "A Star Wars Story itself focuses on the Rebel Alliance which recruits Jyn Erso (Felicity Jones) after the formation of the Galaxy earning his living Told there is a woman named Jyn Erso (Felicity Jones).A rebel soldier and criminal is about to face his greatest challenge when Mon Mothma (Genevieve O'Reilly) sends him on a dangerous mission.Jyn is tasked with stealing the plans for the Death Star, the Empire's weapon of mass destruction that could destroy a planet.With the help of rebel strongholds, swordsmen, and other troops, Jyn will become part of something very big she never thought of before.",
    'image': ImagePath.warsStory,
    'trailerThumbnail': ImagePath.suicide,
  };

  final List<Map<String, String>> trailers = [
    {
      'thumbnail': ImagePath.suicide,
      'duration': '2:45',
      'title': 'Official Trailer',
    },
    {
      'thumbnail': ImagePath.dune,
      'duration': '1:30',
      'title': 'Behind the Scenes',
    },
    {
      'thumbnail': ImagePath.chris,
      'duration': '3:12',
      'title': 'Final Trailer',
    },
  ];
  void onBookmarkPressed() {
    isBookmarked.value = !isBookmarked.value;
    Get.snackbar(
      'Bookmark',
      isBookmarked.value ? 'Added to bookmark' : 'Removed from bookmark',
      snackPosition: SnackPosition.TOP,
    );
  }

  void onMorePressed() {
    isDescriptionExpanded.value = !isDescriptionExpanded.value;
  }

  var selectedPlan = 'annually'.obs;
  void selectPlan(String plan) {
    selectedPlan.value = plan;
  }
}
