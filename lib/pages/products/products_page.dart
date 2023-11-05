import 'package:apps_flyer/apps_flyer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: TextButton(
      //     onPressed: () {
      //       context.go(
      //         RoutePath.productDetailName('0'),
      //       );
      //     },
      //     child: const Text(
      //       'Detail',
      //     ),
      //   ),
      // ),
      body: AppFlyerWebView(
        url: gameUrl,
        appClientKey: appClientKey,
        callback: (p0) {
          if (kDebugMode) print(p0);
          AppsFlyer.instance.setCustomerUserId(p0);
          AppsFlyer.instance.setCustomerIdAndLogSession(p0);
          AppsFlyer.instance.logEvent(p0);
        },
      ),
    );
  }
}
