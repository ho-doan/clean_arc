// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routers.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $rootRoutePage,
    ];

RouteBase get $rootRoutePage => GoRouteData.$route(
      path: '/',
      factory: $RootRoutePageExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'tab/:tab',
          factory: $RootDetailRoutePageExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home',
          factory: $HomeRoutePageExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'profile',
          factory: $ProfileRoutePageExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'products',
          factory: $ProductsRoutePageExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'detail/:id',
              factory: $ProductRoutePageExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'error',
          factory: $ErrorRoutePageExtension._fromState,
        ),
      ],
    );

extension $RootRoutePageExtension on RootRoutePage {
  static RootRoutePage _fromState(GoRouterState state) => RootRoutePage();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RootDetailRoutePageExtension on RootDetailRoutePage {
  static RootDetailRoutePage _fromState(GoRouterState state) =>
      RootDetailRoutePage(
        tab: state.pathParameters['tab']!,
      );

  String get location => GoRouteData.$location(
        '/tab/${Uri.encodeComponent(tab)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HomeRoutePageExtension on HomeRoutePage {
  static HomeRoutePage _fromState(GoRouterState state) => HomeRoutePage();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfileRoutePageExtension on ProfileRoutePage {
  static ProfileRoutePage _fromState(GoRouterState state) =>
      const ProfileRoutePage();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProductsRoutePageExtension on ProductsRoutePage {
  static ProductsRoutePage _fromState(GoRouterState state) =>
      const ProductsRoutePage();

  String get location => GoRouteData.$location(
        '/products',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProductRoutePageExtension on ProductRoutePage {
  static ProductRoutePage _fromState(GoRouterState state) => ProductRoutePage(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/products/detail/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ErrorRoutePageExtension on ErrorRoutePage {
  static ErrorRoutePage _fromState(GoRouterState state) => ErrorRoutePage();

  String get location => GoRouteData.$location(
        '/error',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
