import 'package:shop/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shop/core/usecases/usecase.dart';
import 'package:shop/features/shops/domain/entities/shop_entity.dart';
import 'package:shop/features/shops/domain/repositories/shops_repository.dart';

class GetShops extends UseCase<List<ShopEntity>> {
  final ShopsRepository shopsRepository;
  GetShops(this.shopsRepository);

  @override
  Future<Either<Failure, List<ShopEntity>>> call() async {
    return await shopsRepository.getShops();
  }
}
