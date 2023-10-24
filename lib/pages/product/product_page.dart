import 'package:clean_arc/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../widgets/demo.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.id});

  final String id;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Location(),
        Text('data id detail ${widget.id}'),
        Assets.images.imgCleanBody.image(width: 400, height: 400),
      ],
    ));
  }
}
