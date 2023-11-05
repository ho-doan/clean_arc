import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networks/pages/home/cubit/home_cubit.dart';
import 'package:networks/pages/home/home_page.dart';

import 'core/service/di/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDomainDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => getIt<HomeCubit>()..onInit(),
        child: const HomePage(),
      ),
    );
  }
}
