import 'package:flutter/material.dart';

class WeeklyHighlightItem extends StatelessWidget {
  const WeeklyHighlightItem({
    super.key,
    required this.movie,
  });

  final Map<String, String> movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              image: AssetImage(movie['image']!),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.7),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          movie['time']!,
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          movie['title']!,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xffFFFFFF),
          ),
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Icon(Icons.star, size: 14, color: Color(0xffFFBB38)),
            SizedBox(width: 4),
            Text(
              movie['rating']!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xffFFBB38),
              ),
            ),
            SizedBox(width: 16),
            Text(
              movie['year']!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff9E9E9E),
              ),
            ),
            SizedBox(width: 16),
            Text(
              movie['duration']!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff9E9E9E),
              ),
            ),
            SizedBox(width: 16),
            Text(
              movie['genre']!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff9E9E9E),
              ),
            ),
          ],
        ),
      ],
    );
  }
}