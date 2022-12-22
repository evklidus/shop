import 'package:shop/features/shops/domain/entities/product_characteristic_entity.dart';

class ProductCharacteristicModel extends ProductCharacteristicEntity {
  ProductCharacteristicModel({
    required int id,
    required int weight,
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
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['weight'] = weight;
    return data;
  }
}
