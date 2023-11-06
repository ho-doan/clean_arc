import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networks/core/domain/models/model.dart';
import 'package:networks/pages/home/cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget buildItem(UserPoint userPoint, List<UserPoint> lst) {
    final index = lst.indexOf(userPoint);
    Color color = rankings[index] ?? Colors.lightGreen;
    int size = rankingSizes[index] ?? 14;
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color,
        ),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${index + 1}. ',
                style: TextStyle(
                  fontSize: size.toDouble(),
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: userPoint.name,
                style: TextStyle(
                  fontSize: size.toDouble(),
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: '   ${userPoint.point}',
                style: TextStyle(
                  fontSize: size.toDouble(),
                  color: Colors.brown,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            children: [
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      for (int i = 8; i < 21; i++)
                        TextSpan(
                          text: '*',
                          style: TextStyle(
                            fontSize: i.toDouble(),
                            color: Colors.red,
                          ),
                        ),
                      for (int i = 21; i > 8; i--)
                        TextSpan(
                          text: '*',
                          style: TextStyle(
                            fontSize: i.toDouble(),
                            color: Colors.red,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'RANKINGS',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.red,
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi,
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        for (int i = 8; i < 21; i++)
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              fontSize: i.toDouble(),
                              color: Colors.red,
                            ),
                          ),
                        for (int i = 21; i > 8; i--)
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              fontSize: i.toDouble(),
                              color: Colors.red,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              if (state is HomeSuccess)
                for (final userPoint in state.userPoints)
                  buildItem(userPoint, state.userPoints)
            ],
          ),
        );
      },
    );
  }
}

Map<int, Color> rankings = {
  0: Colors.yellow,
  1: Colors.cyan,
  2: Colors.orange[400]!,
};
Map<int, int> rankingSizes = {
  0: 17,
  1: 16,
  2: 15,
};
