import 'package:shop/features/shops/domain/entities/product_entity.dart';

class ShopEntity {
  final int id;
  final String name;
  final List<ProductEntity> products;

  const ShopEntity({
    required this.id,
    required this.name,
    required this.products,
  });
}
