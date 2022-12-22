import 'package:shop/features/shops/data/models/product_characteristic_model.dart';
import 'package:shop/features/shops/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  final List<ProductCharacteristicModel> characteristics;

  ProductModel({
    required this.characteristics,
    required int id,
    required String name,
  }) : super(id: id, name: name, productCharacteristics: characteristics);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final List<ProductCharacteristicModel> characteristics = [];
    json['characteristics'].forEach((characteristic) {
      characteristics.add(ProductCharacteristicModel.fromJson(characteristic));
    });
    final id = json['id'];
    final name = json['name'];
    return ProductModel(
      id: id,
      name: name,
      characteristics: characteristics,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['characteristics'] = characteristics
        .map((characteristic) => characteristic.toJson())
        .toList();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
