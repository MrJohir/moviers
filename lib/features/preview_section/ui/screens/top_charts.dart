import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviers/features/auth/ui/widget/auth_appbar.dart';
import '../../controller/top_charts_controller.dart';

class TopChartsScreen extends StatelessWidget {
  TopChartsScreen({super.key});
  final TopChartsController controller = Get.put(TopChartsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0A0A),
      appBar: AuthAppBar(text: 'Top Charts'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: GridView.builder(
          itemCount: controller.topChartMovies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 11,
            mainAxisSpacing: 20,
            childAspectRatio: 0.48,
          ),
          itemBuilder: (context, index) {
            return _buildMovieCard(
              controller.topChartMovies[index],
              controller,
            );
          },
        ),
      ),
    );
  }

  Widget _buildMovieCard(
    Map<String, String> movie,
    TopChartsController controller,
  ) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie poster
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: AssetImage(movie['image']!),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            movie['title'] ?? '',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xffFFFFFF),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 6),
          Row(
            children: [
              Icon(Icons.star, size: 14, color: Color(0xffFFBB38)),
              SizedBox(width: 4),
              Text(
                movie['rating'] ?? '',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffFFBB38),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Text(
                  movie['year'] ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff9E9E9E),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  movie['duration'] ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff9E9E9E),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
