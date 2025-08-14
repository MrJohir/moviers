import 'package:flutter/material.dart';

import '../../../auth/ui/widget/auth_appbar.dart';

class Personalization extends StatelessWidget {
  const Personalization({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(text: 'Personalization'),
      backgroundColor: Color(0xff0A0A0A),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Personalization',
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

            GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1/2,

              ),
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
