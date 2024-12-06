import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:purotaja/app_routes.dart';
import 'package:purotaja/widgets/top_banner.dart';

import 'app_theme.dart';
import 'controllers/user_controller.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  Get.put(UserController());
  Get.put(TopBannerController());
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Set this to the color you want
    statusBarIconBrightness: Brightness.dark, // Adjust icon brightness
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Puro Taja',
      theme: AppTheme.lightTheme,
      initialRoute: '/splash',
      getPages: AppRoutes.routes,
    );
  }
}
