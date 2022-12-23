import 'package:shop/features/shops/domain/entities/shop_entity.dart';

/*
 Надо фильтровать в беке, но Firebase не может фильтровать сразу
 по 2-м или более параметрам
*/

List<ShopEntity>? filterShops(
  List<ShopEntity> shops,
  String name,
  int weight,
) {
  List<ShopEntity>? filteredShops = shops
      .where(
        (shop) => _isShopHasProduct(shop, name, weight),
      )
      .toList();
  return filteredShops;
}

bool _isShopHasProduct(
  ShopEntity shop,
  String name,
  int weight,
) {
  for (var product in shop.products) {
    final bool hasName = product.name == name;
    bool hasCharacteristic = false;
    for (var characteristic in product.productCharacteristics) {
      if (characteristic.weight == weight) {
        hasCharacteristic = true;
        break;
      }
    }
    if (hasName && hasCharacteristic) {
      return true;
    }
  }
  return false;
}
