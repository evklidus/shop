import 'package:shop/features/shops/domain/entities/product_characteristic_entity.dart';

class ProductCharacteristicModel extends ProductCharacteristicEntity {
  final int id;
  final int weight;

  ProductCharacteristicModel({
    required this.id,
    required this.weight,
  }) : super(
          id: id,
          weight: weight,
        );

  factory ProductCharacteristicModel.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final weight = json['weight'];
    return ProductCharacteristicModel(
      id: id,
      weight: weight,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['weight'] = this.weight;
    return data;
  }
}
