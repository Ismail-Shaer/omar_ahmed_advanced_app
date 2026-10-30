import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omar_ahmed_advanced_app/core/routing/app_routes.dart';
import 'package:omar_ahmed_advanced_app/core/theming/app_colors.dart';

import 'core/routing/app_router.dart';


class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          title: 'Doc App',
          theme: ThemeData(
            primaryColor: AppColors.mainBlue,
            scaffoldBackgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.onBoardingRoute,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}