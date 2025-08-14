import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AuthAppBar extends StatelessWidget implements PreferredSizeWidget{
  const AuthAppBar({
    super.key, required this.text,
  });

  final String text;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff0A0A0A),
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.arrow_back, color: Color(0xffFFFFFF)),
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Color(0xffFFFFFF),
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