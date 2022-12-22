import 'package:flutter/material.dart';
import 'package:shop/features/shops/domain/entities/shop_entity.dart';

class ShopWidget extends StatelessWidget {
  final ShopEntity shop;
  const ShopWidget({
    required this.shop,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black12,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 15,
          ),
        ],
      ),
      child: Text(
        shop.name,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.redAccent,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
