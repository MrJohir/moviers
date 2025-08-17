import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../movie_details/controller/movie_details_controller.dart';

class SubscribeCard extends StatelessWidget {
  const SubscribeCard({super.key, required this.controller});

  final MovieDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 40),
        child: Row(
          children: [
            // Annually button
            Expanded(
              child: InkWell(
                onTap: () => controller.selectPlan('annually'),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color:
                        controller.selectedPlan.value == 'annually'
                            ? Color(0xff2196F3)
                            : Color(0xff2A2A2A),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Annually',
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 6),
                        child: Text(
                          '\$79.99 / year',
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        'Billed annually save 33% daily trial',
                        style: TextStyle(
                          color: Color(0xff9E9E9E),
                          fontSize: 10,
                        ),
                        maxLines: 1,
                        // textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 12),

            // Monthly button
            Expanded(
              child: GestureDetector(
                onTap: () => controller.selectPlan('monthly'),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color:
                        controller.selectedPlan.value == 'monthly'
                            ? Color(0xff2196F3)
                            : Color(0xff2A2A2A),
                    borderRadius: BorderRadius.circular(8),
                    border:
                        controller.selectedPlan.value == 'monthly'
                            ? Border.all(color: Color(0xff2196F3), width: 2)
                            : null,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Monthly',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '\$7.99 / monthly',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Billed monthly',
                        style: TextStyle(
                          color: Color(0xffB0B0B0),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
