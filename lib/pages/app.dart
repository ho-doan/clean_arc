import 'package:clean_arc/pages/home/home_page.dart';
import 'package:clean_arc/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

enum Tab { home, profile }

extension StringX on String {
  Tab? get tab {
    switch (this) {
      case 'home':
        return Tab.home;
      case 'profile':
        return Tab.profile;
    }
    return Tab.home;
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key, required this.tab});

  final Tab tab;

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late PageController controller;
  @override
  void initState() {
    controller = PageController(initialPage: widget.tab.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: const [
        HomePage(),
        ProfilePage(),
      ],
    );
  }
}
