import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/utils/app_strings.dart';
import 'package:itcores_internship_project/core/routes/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child){
        return MaterialApp.router(
          routerConfig: Routes.routes,
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Inter',
          ),
      );
      },
    );
  }
}
