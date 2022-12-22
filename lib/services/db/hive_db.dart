import 'package:shop/core/constants/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop/features/shops/domain/entities/shop_entity.dart';
import 'package:shop/features/shops/domain/entities/product_characteristic_entity.dart';
import 'package:shop/features/shops/domain/entities/product_entity.dart';

abstract class Database {
  Future<List<ShopEntity>?> getShops();
  Future<void> setShops(List<ShopEntity> shops);
}

class HiveDB extends Database {
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProductCharacteristicEntityAdapter());
    Hive.registerAdapter(ProductEntityAdapter());
    Hive.registerAdapter(ShopEntityAdapter());
  }

  @override
  Future<List<ShopEntity>?> getShops() async {
    final shopsBox = await Hive.openBox(HiveConstants.shopsBoxName);
    final List<ShopEntity> shops = List<ShopEntity>.from(
      shopsBox.get(HiveConstants.allShopsKeyForShopsBox),
    ); // Простым as тут не обойтись, проверено тестами и ребятами на stackoverflow
    return shops;
  }

  @override
  Future<void> setShops(List<ShopEntity> shops) async {
    final shopsBox = await Hive.openBox(HiveConstants.shopsBoxName);
    await shopsBox.putAll({HiveConstants.allShopsKeyForShopsBox: shops});
  }
}
