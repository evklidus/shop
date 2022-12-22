import 'package:shop/features/shops/domain/entities/shop_entity.dart';
import 'package:shop/services/db/hive_db.dart';

abstract class ShopsLocalDataSource {
  Future<List<ShopEntity>?> getShopsFromDB();
  Future<void> setShopsToDB(List<ShopEntity> shops);
}

class ShopsLocalDataSourceImpl implements ShopsLocalDataSource {
  final Database database;
  ShopsLocalDataSourceImpl(this.database);

  @override
  Future<List<ShopEntity>?> getShopsFromDB() async {
    return await database.getShops();
  }

  @override
  Future<void> setShopsToDB(List<ShopEntity> shops) async {
    await database.setShops(shops);
  }
}
