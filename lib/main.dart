import 'dart:io';

import 'package:ecommerce_c17_online/core/caching/cache_helper.dart';
import 'package:ecommerce_c17_online/core/routes_manager/routes.dart';
import 'package:ecommerce_c17_online/core/routes_manager/routes.dart';
import 'package:ecommerce_c17_online/di.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes_manager/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final cacheHelper = getIt<CacheHelper>();

  @override
  Widget build(BuildContext context) {
    String? token = cacheHelper.getString('token');
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: token != null ? Routes.mainRoute : Routes.signInRoute,
      ),
    );
  }
}
