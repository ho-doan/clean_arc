import 'package:clean_arc/core/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            context.go(
              RoutePath.productDetailName('0'),
            );
          },
          child: const Text(
            'Detail',
          ),
        ),
      ),
    );
  }
}
