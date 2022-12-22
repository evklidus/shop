import 'package:shop/features/shops/domain/entities/product_characteristic_entity.dart';

class ProductEntity {
  final int id;
  final String name;
  final List<ProductCharacteristicEntity> productCharacteristics;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.productCharacteristics,
  });
}
