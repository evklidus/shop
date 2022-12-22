import 'package:shop/features/shops/data/models/product_model.dart';
import 'package:shop/features/shops/domain/entities/shop_entity.dart';

class ShopModel extends ShopEntity {
  // final int id;
  // final String name;
  // final List<ProductModel> products;

  ShopModel({
    required int id,
    required String name,
    required List<ProductModel> products,
  }) : super(
          id: id,
          name: name,
          products: products,
        );

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['name'];
    final products = <ProductModel>[];
    json['products'].forEach((product) {
      products.add(ProductModel.fromJson(product));
    });
    return ShopModel(id: id, name: name, products: products);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['products'] =
        products.map((product) => (product as ProductModel).toJson()).toList();
    return data;
  }
}
