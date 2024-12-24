import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:purotaja/app_routes.dart';
import 'package:purotaja/controllers/category_controller.dart';
import 'package:purotaja/controllers/products_controller.dart';
import 'package:purotaja/widgets/top_banner.dart';

import 'app_theme.dart';
import 'controllers/address_controller.dart';
import 'controllers/user_controller.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  Get.put(UserController());
  Get.put(TopBannerController());
  Get.put(ProductsController());
  Get.put(CategoryController());
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Puro Taja',
      theme: AppTheme.lightTheme(context),
      initialRoute: '/splash',
      getPages: AppRoutes.routes,
    );
  }
}
