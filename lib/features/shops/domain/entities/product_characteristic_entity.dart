import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'product_characteristic_entity.g.dart';

@HiveType(typeId: 0, adapterName: "ProductCharacteristicEntityAdapter")
class ProductCharacteristicEntity extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int weight;

  ProductCharacteristicEntity({
    required this.id,
    required this.weight,
  });

  @override
  List<Object?> get props => [id, weight];
}
