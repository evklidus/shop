import 'package:equatable/equatable.dart';
import 'package:shop/features/shops/domain/entities/product_entity.dart';
import 'package:hive/hive.dart';

part 'shop_entity.g.dart';

@HiveType(typeId: 2, adapterName: "ShopEntityAdapter")
class ShopEntity extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final List<ProductEntity> products;

  ShopEntity({
    required this.id,
    required this.name,
    required this.products,
  });

  @override
  List<Object?> get props => [id, name, products];
}
