import 'package:flutter/material.dart';
import 'package:shop/components/custom_card.dart';
import 'package:shop/components/custom_title.dart';
import 'package:shop/features/shops/domain/entities/product_entity.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget(this.product, {super.key});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: 500,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomTitle('id: ${product.id}'),
          CustomTitle('name: ${product.name}'),
        ],
      ),
    );
  }
}
