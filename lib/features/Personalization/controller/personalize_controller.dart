import 'package:get/get.dart';
import 'package:moviers/core/utils/image_path.dart';

class PersonalizeController extends GetxController {

  List gridViewItem = [
    ImagePath.index1,
    ImagePath.index2,
    ImagePath.index3,
    ImagePath.index4,
    ImagePath.index1,
    ImagePath.index2,
  ];


  RxList<bool> selectedItems = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();
    selectedItems.value = List.generate(gridViewItem.length, (_) => false);
  }

  void toggleSelection(int index) {
    selectedItems[index] = !selectedItems[index];
  }

}
