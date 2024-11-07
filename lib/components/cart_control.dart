import 'package:flutter/material.dart';

class CartControl extends StatefulWidget {
  final void Function(int) addToCart;

  const CartControl({
    required this.addToCart,
    super.key,
  });

  @override
  State<CartControl> createState() => _CartControlState();
}

class _CartControlState extends State<CartControl> {
  // 5
  int _cartNumber = 1;
  @override
  Widget build(BuildContext context) {
    // 6
    final colorScheme = Theme.of(context).colorScheme;
    // 7
    return Row(
      // 8
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // 9
      children: [
        _buildMinusButton(),
        _buildCartNumberContainer(colorScheme),
        _buildPlusButton(),
        const Spacer(),
        _buildAddCartButton(),
      ],
    );
  }

  Widget _buildMinusButton() {
    return IconButton(
      icon: const Icon(Icons.remove),
      onPressed: () {
        setState(() {
          if (_cartNumber > 1) {
            _cartNumber--;
          }
        });
      },
      tooltip: 'Decrease Cart Count',
    );
  }

  Widget _buildCartNumberContainer(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: colorScheme.onPrimary,
      child: Text(_cartNumber.toString()),
    );
  }

  Widget _buildPlusButton() {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        setState(() {
          _cartNumber++;
        });
      },
      tooltip: 'Increase Cart Count',
    );
  }

  Widget _buildAddCartButton() {
    return FilledButton(
      onPressed: () {
        widget.addToCart(_cartNumber);
      },
      child: const Text('Add to Cart'),
    );
  }
}
