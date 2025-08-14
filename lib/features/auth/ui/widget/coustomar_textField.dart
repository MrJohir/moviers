import 'package:flutter/material.dart';

class CoustomTextField extends StatelessWidget {
  const CoustomTextField({
    super.key, required this.text,required this.prefixIcon, required this.controller, this.onChanged,
  });

  final String text;
  final Widget prefixIcon;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          prefixIconColor: Color(0xff9E9E9E),
          hintText: text,
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xffC2C2C2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Color(0xffFFFFFF).withValues(alpha: 0.24),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Color(0xffFFFFFF).withValues(alpha: 0.24),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Color(0xffFFFFFF).withValues(alpha: 0.24),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Color(0xffFFFFFF).withValues(alpha: 0.24),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Color(0xffFFFFFF).withValues(alpha: 0.24),
            ),
          ),
        ),
      ),
    );
  }
}