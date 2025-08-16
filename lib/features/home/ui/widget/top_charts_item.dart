import 'package:flutter/material.dart';

class TopChartsItem extends StatelessWidget {
  const TopChartsItem({
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
          width: double.infinity,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              image: AssetImage(movie['image']!),
              fit: BoxFit.cover,
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
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Icon(Icons.star, size: 16, color: Color(0xffFFBB38)),
            SizedBox(width: 4),
            Text(
              movie['rating'] ?? '',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xffFFBB38),
              ),
            ),
            SizedBox(width: 16),
            Text(
              movie['year'] ?? '',
              style: TextStyle(fontSize: 14, color: Color(0xff9E9E9E)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                movie['duration'] ?? '',
                style: TextStyle(fontSize: 14, color: Color(0xff9E9E9E)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              movie['genre'] ?? '',
              style: TextStyle(fontSize: 14, color: Color(0xff9E9E9E)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
