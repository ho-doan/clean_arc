import 'dart:async';
import 'dart:developer';

import 'package:clean_arc/core/router/routers.dart';
import 'package:clean_arc/pages/app/cubit/app_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/di/service_locator.dart';

const String appFlyerToken = 'RfmkDHieaX9xcNMN4hNvMk';
const String appClientKey = 'apkClient';
const String gameUrl = 'https://hi.game/?pid=1025';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    configureDependencies(Dio());

    runApp(const MyApp());
  }, (error, stack) {
    log(error.toString());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppCubit>()..onInit(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: Routes.instance.router,
      ),
    );
  }
}
