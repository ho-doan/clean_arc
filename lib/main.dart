import 'package:clean_arc/core/router/routers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'core/services/di/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(Dio());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: Routes.instance.router,
    );
  }
}
