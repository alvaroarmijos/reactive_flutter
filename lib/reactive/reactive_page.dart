import 'package:flutter/material.dart';
import 'package:reactive_flutter/reactive/cart_provider.dart';

import '../products.dart';
import '../widgets/cart_notification.dart';
import '../widgets/product_square.dart';

class ReactivePage extends StatelessWidget {
  const ReactivePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartBloc = CartProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Reactive"),
        actions: [
          StreamBuilder<int>(
              stream: cartBloc.itemCount,
              initialData: 0,
              builder: (_, snapshot) {
                return CartNotification(
                  count: snapshot.data!,
                );
              }),
        ],
      ),
      body: const ProductGrid(),
    );
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final cartBloc = CartProvider.of(context);
    return GridView.count(
      crossAxisCount: 2,
      children: products
          .map((product) => ProductSquare(
                product: product,
                onTap: () {
                  cartBloc.addition.add(product);
                },
              ))
          .toList(),
    );
  }
}
