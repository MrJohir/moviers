import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:moviers/core/utils/image_path.dart';
import 'package:moviers/features/auth/ui/widget/coustom_button.dart';
import '../../../auth/ui/widget/auth_appbar.dart';
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
                  Text(
                    '0 from 6',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff298CFF),
                    ),
                  ),
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
                  return SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            // image: DecorationImage(
                            //   image: SvgPicture.asset(controller.gridViewItem[index]),
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          // child: Image.asset(ImagePath.splash,fit: BoxFit.cover,),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              // ImagePath.index4,
                              controller.gridViewItem[index],
                              fit: BoxFit.cover,
                            ),
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
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            ),
          ],
        ),
      ),
    );
  }
}
