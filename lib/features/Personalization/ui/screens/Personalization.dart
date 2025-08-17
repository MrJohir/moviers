import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviers/features/auth/ui/widget/coustom_button.dart';
import '../../../auth/ui/widget/auth_appbar.dart';
import '../../../bottom_nav_bar/ui/screens/bottom_nav_bar_screen.dart';
import '../../controller/personalize_controller.dart';

class Personalization extends StatelessWidget {
  Personalization({super.key});
  final PersonalizeController controller = Get.put(PersonalizeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(text: 'Personalization'),
      backgroundColor: Color(0xff0A0A0A),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Choose your genre',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffC2C2C2),
                    ),
                  ),
                  Obx(() {
                    int selectedCount =
                        controller.selectedItems.where((item) => item).length;
                    int totalCount = controller.selectedItems.length;
                    return Text(
                      '$selectedCount from $totalCount',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff298CFF),
                      ),
                    );
                  }),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: controller.gridViewItem.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 12,
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder: (context, index) {
                  return Obx(() {
                    bool isSelected = controller.selectedItems[index];
                    return SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.toggleSelection(index);
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color:
                                          isSelected
                                              ? Color(0xff298CFF)
                                              : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Image.asset(
                                      controller.gridViewItem[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                if (isSelected)
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Color(0xff298CFF),
                                      size: 20,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 6),
                            child: Text(
                              'Aston',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.people_outline,
                                size: 16,
                                color: Color(0xff9E9E9E),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Text(
                                  '4324 like this',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff9E9E9E),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
                },
              ),
            ),
            CoustomaButton(
              text: 'Continue',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xffFFFFFF),
              ),
              backgroundColor: Color(0xff298CFF),
              onPressed: () {
                Get.offAll(() => BottomNavbarScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
