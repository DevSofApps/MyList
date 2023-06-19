import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_list/app/core/routes/route_pages.dart';

import 'app/bindings/app_binding.dart';
import 'app/core/config/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MyList',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: AppColors.primary,
            onPrimary: AppColors.primary,
            secondary: AppColors.primaryLight,
            onSecondary: AppColors.white,
            error: Colors.red,
            onError: Colors.red,
            background: AppColors.background,
            onBackground: AppColors.background,
            surface: AppColors.grey,
            onSurface: AppColors.hoverGray),
        appBarTheme: const AppBarTheme(
          color: AppColors.primary,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white),
          elevation: 1,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
