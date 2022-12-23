import 'package:flutter/material.dart';
import 'package:shop/features/shops/domain/entities/product_entity.dart';
import 'package:shop/features/shops/presentation/widgets/product_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen(
    this.product, {
    super.key,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Center(
        child: ProductWidget(product),
      ),
    );
  }
}
