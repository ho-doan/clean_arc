import 'package:clean_arc/core/router/router_path.dart';
import 'package:clean_arc/pages/home/cubits/location/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/demo.dart';
import 'cubits/home/home_cubit.dart';
import 'widgets/button_update_counter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeCubit get cubit => context.read<HomeCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {},
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (state is HomeSuccess) Text('counter ${state.counter}'),
                  if (state is HomeSuccess) ButtonUpdateCounter(cubit: cubit),
                  const Location(),
                  ElevatedButton(
                    onPressed: () {
                      context.go(RoutePath.productsName);
                    },
                    child: const Text('Products'),
                  ),
                  BlocBuilder<LocationCubit, LocationState>(
                    bloc: cubit.locationCubit,
                    builder: (context, state) {
                      if (state is! LocationSuccess) {
                        return const CircularProgressIndicator();
                      }
                      return Text(state.counter.toString());
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
