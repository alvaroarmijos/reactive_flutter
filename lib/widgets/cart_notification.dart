import 'package:flutter/material.dart';

class CartNotification extends StatelessWidget {
  const CartNotification({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Center(
        child: Badge.count(
          count: count,
          child: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
