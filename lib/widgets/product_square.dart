import 'dart:math';

import 'package:flutter/material.dart';

class ProductSquare extends StatelessWidget {
  const ProductSquare({
    super.key,
    required this.product,
    required this.onTap,
  });

  final String product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color(Random().nextInt(0xffffffff)),
        child: Center(child: Text(product)),
      ),
    );
  }
}
