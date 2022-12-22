import 'package:equatable/equatable.dart';
import 'package:shop/features/shops/domain/entities/product_characteristic_entity.dart';
import 'package:hive/hive.dart';

part 'product_entity.g.dart';

@HiveType(typeId: 1, adapterName: "ProductEntityAdapter")
class ProductEntity extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final List<ProductCharacteristicEntity> productCharacteristics;

  ProductEntity({
    required this.id,
    required this.name,
    required this.productCharacteristics,
  });

  @override
  List<Object?> get props => [id, name, productCharacteristics];
}
