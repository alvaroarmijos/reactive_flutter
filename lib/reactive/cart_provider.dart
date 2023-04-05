import 'package:flutter/material.dart';

import 'bloc/cart_bloc.dart';

class CartProvider extends InheritedWidget {
  final CartBloc cartBloc;

  CartProvider({
    Key? key,
    CartBloc? cartBloc,
    required Widget child,
  })  : cartBloc = cartBloc ?? CartBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CartBloc of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<CartProvider>()
              as CartProvider)
          .cartBloc;
}
