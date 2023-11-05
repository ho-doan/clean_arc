import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networks/pages/home/cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            children: [
              if (state is HomeSuccess)
                for (final userPoint in state.userPoints)
                  Text('${userPoint.name}'),
            ],
          ),
        );
      },
    );
  }
}
