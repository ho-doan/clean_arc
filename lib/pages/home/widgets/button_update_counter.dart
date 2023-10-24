import 'package:flutter/material.dart';

import '../cubits/home/home_cubit.dart';

class ButtonUpdateCounter extends StatelessWidget {
  const ButtonUpdateCounter({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => cubit.onUpdate(),
      child: const Text('Increment'),
    );
  }
}
