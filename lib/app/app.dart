
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviers/app/app_routes.dart';

class Moviers extends StatelessWidget {
  const Moviers({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loginScreen',
    getPages: AppRoute.routes,
    );
  }
}
