import 'package:flutter/material.dart';
import 'package:shop/components/custom_title.dart';
import 'package:shop/features/shops/domain/entities/shop_entity.dart';
import 'package:shop/features/shops/presentation/widgets/shop_widget.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen(
    this.shop, {
    super.key,
  });

  final ShopEntity shop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shop.name),
      ),
      body: Center(
        child: CustomTitle(shop.name),
      ),
    );
  }
}
