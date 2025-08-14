import 'package:flutter/material.dart';

class SplashAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SplashAppBar({
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF0A0A0A),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'M',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'o',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'viers',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      centerTitle: true,
      actions: [
        Text(
          'Skip',
          style: TextStyle(
            color: Color(0xff9E9E9E),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
      actionsPadding: EdgeInsets.only(right: 18),
    );
  }
}