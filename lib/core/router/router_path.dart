class RoutePath {
  RoutePath._internal();
  static const String root = '/';
  static const String rootDetail = 'tab/:tab';
  static const String home = 'home';
  static const String error = 'error';
  static const String profile = 'profile';
  static const String products = 'products';
  static const String productsName = '/products';
  static const String productDetail = 'detail/:id';
  static String productDetailName(String id) => '/$products/detail/$id';
}
