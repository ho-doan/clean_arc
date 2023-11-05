import 'package:clean_arc/core/router/router_path.dart';
import 'package:clean_arc/core/services/di/service_locator.dart';
import 'package:clean_arc/pages/app/app.dart';
import 'package:clean_arc/pages/home/cubits/home/home_cubit.dart';
import 'package:clean_arc/pages/home/home_page.dart';
import 'package:clean_arc/pages/product/product_page.dart';
import 'package:clean_arc/pages/products/products_page.dart';
import 'package:clean_arc/pages/profile/profile_page.dart';
import 'package:flutter/material.dart' hide Tab;
import 'package:go_router/go_router.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/error/error_page.dart';

part 'routers.g.dart';

class Routes {
  Routes();

  static final instance = Routes();

  final router = GoRouter(
    initialLocation: RoutePath.root,
    debugLogDiagnostics: true,
    routes: $appRoutes,
    errorBuilder: (context, state) => const ErrorPage(),
  );
}

@TypedGoRoute<RootRoutePage>(
  path: RoutePath.root,
  routes: [
    TypedGoRoute<RootDetailRoutePage>(path: RoutePath.rootDetail),
    TypedGoRoute<HomeRoutePage>(path: RoutePath.home),
    TypedGoRoute<ProfileRoutePage>(path: RoutePath.profile),
    TypedGoRoute<ProductsRoutePage>(
      path: RoutePath.products,
      routes: [
        TypedGoRoute<ProductRoutePage>(path: RoutePath.productDetail),
      ],
    ),
    TypedGoRoute<ErrorRoutePage>(path: RoutePath.error),
  ],
)
class RootRoutePage extends GoRouteData {
  RootRoutePage();

  @override
  Widget build(context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (BuildContext context) => getIt<HomeCubit>()..onInit(),
          ),
        ],
        child: const RootPage(tab: Tab.home),
      );
}

class RootDetailRoutePage extends GoRouteData {
  const RootDetailRoutePage({required this.tab});
  final String tab;
  @override
  Widget build(context, state) {
    if (tab.tab == null) {
      context.go(RoutePath.error);
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => getIt<HomeCubit>()..onInit(),
        ),
      ],
      child: RootPage(tab: tab.tab!),
    );
  }
}

class HomeRoutePage extends GoRouteData {
  HomeRoutePage();

  @override
  Widget build(context, state) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..onInit(),
      child: const HomePage(),
    );
  }
}

class ProfileRoutePage extends GoRouteData {
  const ProfileRoutePage();

  @override
  Widget build(context, state) {
    return const ProfilePage();
  }
}

class ProductsRoutePage extends GoRouteData {
  const ProductsRoutePage();

  @override
  Widget build(context, state) {
    return const ProductsPage();
  }
}

class ProductRoutePage extends GoRouteData {
  const ProductRoutePage(this.id);

  final String id;

  @override
  Widget build(context, state) {
    return ProductPage(id: id);
  }
}

class ErrorRoutePage extends GoRouteData {
  ErrorRoutePage();

  @override
  Widget build(context, state) {
    return const ErrorPage();
  }
}
