import 'package:shop/features/shops/domain/entities/shop_entity.dart';
import 'package:shop/services/http/http_service.dart';

abstract class ShopsRemoteDataSource {
  Future<List<ShopEntity>> getShops();
}

class ShopsRemoteDataSourceImpl implements ShopsRemoteDataSource {
  final HttpService httpService;
  ShopsRemoteDataSourceImpl(this.httpService);

  @override
  Future<List<ShopEntity>> getShops() async {
    return await httpService.getShops();
  }
}
