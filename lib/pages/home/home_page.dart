import 'dart:async';
import 'dart:math' as math;
import 'package:animated_background/animated_background.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:clean_arc/gen/assets.gen.dart';
import 'package:clean_arc/pages/app/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/home/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  HomeCubit get cubit => context.read<HomeCubit>();
  int count = 0;
  late ParticleOptions particleOptions;
  bool showTap = true;
  Timer? _timer;
  @override
  void initState() {
    particleOptions = ParticleOptions(
      image: Assets.images.logo.image(),
      baseColor: Colors.blue,
      spawnOpacity: 0.2,
      opacityChangeRate: 0.25,
      minOpacity: 0.2,
      maxOpacity: 0.7,
      spawnMinSpeed: math.min(count.toDouble(), 30),
      spawnMaxSpeed: math.max(count.toDouble(), 30),
      spawnMinRadius: 7.0,
      spawnMaxRadius: 15.0,
      particleCount: count,
    );
    super.initState();
  }

  _reset() {
    context.read<AppCubit>().onUpdatePoint(count.toString());
    setState(() {
      showTap = true;
      count = 0;
      particleOptions = ParticleOptions(
        image: Assets.images.logo.image(),
        baseColor: Colors.blue,
        spawnOpacity: 0.2,
        opacityChangeRate: 0.25,
        minOpacity: 0.2,
        maxOpacity: 0.7,
        spawnMinSpeed: math.min(0, 30),
        spawnMaxSpeed: math.max(0, 30),
        spawnMinRadius: 7.0,
        spawnMaxRadius: 15.0,
        particleCount: count,
      );
    });
  }

  _onTap() {
    final c = count + 1 > 100 ? 100 : count + 1;
    _timer?.cancel();
    int cTime = 2;
    setState(() {
      showTap = false;
      count = c;
      particleOptions = ParticleOptions(
        image: Assets.images.logo.image(),
        baseColor: Colors.blue,
        spawnOpacity: 0.2,
        opacityChangeRate: 0.25,
        minOpacity: 0.2,
        maxOpacity: 0.7,
        spawnMinSpeed: math.min(c.toDouble(), 30),
        spawnMaxSpeed: math.max(c.toDouble(), 30),
        spawnMinRadius: 7.0,
        spawnMaxRadius: 15.0,
        particleCount: count,
      );
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        cTime--;
        if (cTime == 0) {
          _reset();
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {},
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: Visibility(
              visible: showTap,
              child: IgnorePointer(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green.withOpacity(.4),
                  ),
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 25.0,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText(
                          "Tap me!",
                          speed: const Duration(milliseconds: 200),
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.cyan,
                          ),
                        ),
                      ],
                      isRepeatingAnimation: true,
                      repeatForever: true,
                    ),
                  ),
                ),
              ),
            ),
            body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Assets.images.i4.provider(),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: AnimatedBackground(
                    behaviour: RandomParticleBehaviour(
                      options: particleOptions,
                      paint: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1.0,
                    ),
                    vsync: this,
                    child: Container(),
                  ),
                ),
                Positioned.fill(
                    child: InkWell(
                  onTap: () => _onTap(),
                  child: const SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
