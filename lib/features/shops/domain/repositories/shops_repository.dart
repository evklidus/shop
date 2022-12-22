import 'package:dartz/dartz.dart';
import 'package:shop/core/errors/failure.dart';
import 'package:shop/features/shops/domain/entities/shop_entity.dart';

abstract class ShopsRepository {
  Future<Either<Failure, List<ShopEntity>>> getShops();
}
