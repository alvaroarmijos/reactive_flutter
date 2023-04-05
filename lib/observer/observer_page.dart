import 'package:flutter/material.dart';
import 'package:reactive_flutter/observer/data_provider.dart';
import 'package:reactive_flutter/observer/observable/observer.dart';

import '../products.dart';
import '../widgets/cart_notification.dart';
import '../widgets/product_square.dart';

class ObserverPage extends StatelessWidget {
  const ObserverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _dataProvider = DataProvider();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Observer"),
        actions: const [
          Notification(),
        ],
      ),
      body: ProductGrid(
        onTap: () => _dataProvider.changeCount(),
      ),
    );
  }
}

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> implements Observer<int> {
  final DataProvider _dataProvider = DataProvider();
  int itemCount = 0;

  @override
  void initState() {
    _dataProvider.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    _dataProvider.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CartNotification(
      count: itemCount,
    );
  }

  @override
  void notifyChange(int newValue) {
    setState(() {
      itemCount = newValue;
    });
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: products
          .map((product) => ProductSquare(
                product: product,
                onTap: onTap,
              ))
          .toList(),
    );
  }
}
