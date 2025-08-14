import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class CoustomaButton extends StatelessWidget {
  const CoustomaButton({
    super.key,
    required this.text,
    required this.style,
    required this.backgroundColor,
    this.borderColor,
    this.image, this.onPressed,

  });
  final String text;
  final TextStyle style;
  final Color? backgroundColor;
  final Color? borderColor;
  final String? image;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ).copyWith(
          backgroundColor: WidgetStateProperty.all(backgroundColor),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null)
              SvgPicture.asset(
                image!,
                width: 16,
                height: 16,
                placeholderBuilder: (context) => SizedBox.shrink(),
              ),
            if (image != null) SizedBox(width: 8),
            Text(
              text,
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}