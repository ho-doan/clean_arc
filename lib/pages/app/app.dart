import 'package:clean_arc/core/router/router_path.dart';
import 'package:clean_arc/pages/home/home_page.dart';
import 'package:clean_arc/pages/products/products_page.dart';
import 'package:clean_arc/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum Tab { home, profile, product }

extension StringX on String {
  Tab? get tab {
    switch (this) {
      case 'home':
        return Tab.home;
      case 'profile':
        return Tab.profile;
      case 'product':
        return Tab.product;
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
  late ValueNotifier<int> notifier;
  @override
  void initState() {
    notifier = ValueNotifier(widget.tab.index);
    controller = PageController(initialPage: widget.tab.index);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant RootPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (notifier.value == 2) {
          context.go(RoutePath.rootHome);
          notifier.value = 0;
          controller.jumpToPage(0);
          controller.animateToPage(
            0,
            duration: const Duration(milliseconds: 120),
            curve: Curves.bounceOut,
          );
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: PageView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomePage(),
              ProfilePage(),
              ProductsPage(),
            ],
          ),
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: notifier,
          builder: (context, value, _) {
            if (value == 2) return const SizedBox.shrink();
            return BottomNavigationBar(
              onTap: (value) {
                switch (value) {
                  case 0:
                    context.go(RoutePath.rootHome);
                  case 1:
                    context.go(RoutePath.rootProfile);
                  case 2:
                    context.go(RoutePath.rootProduct);
                }
                notifier.value = value;
                controller.jumpToPage(value);
                controller.animateToPage(
                  value,
                  duration: const Duration(milliseconds: 120),
                  curve: Curves.bounceOut,
                );
              },
              currentIndex: value,
              items: const [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: 'Profile',
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                ),
                BottomNavigationBarItem(
                  label: 'Product',
                  icon: Icon(Icons.category_outlined),
                  activeIcon: Icon(Icons.category),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
