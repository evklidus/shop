import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shop/features/shops/domain/entities/shop_entity.dart';
import 'package:shop/features/shops/presentation/widgets/shop_widget.dart';

class ShopsLoadedScreen extends StatelessWidget {
  final List<ShopEntity> shops;
  const ShopsLoadedScreen({
    required this.shops,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: GridView(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 30,
        ),
        children: shops
            .map(
              (shop) => ShopWidget(shop: shop),
            )
            .toList(),
      ),
    );
  }
}
