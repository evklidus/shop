import 'package:shop/core/errors/exceptions.dart';
import 'package:shop/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shop/features/shops/data/datasources/shops_remote_datasource.dart';
import 'package:shop/features/shops/domain/entities/shop_entity.dart';
import 'package:shop/features/shops/domain/repositories/shops_repository.dart';
import 'package:shop/services/http/network_info.dart';

class ShopsRepositoryImpl implements ShopsRepository {
  final NetworkInfo networkInfo;
  final ShopsRemoteDataSource shopsRemoteDataSource;

  ShopsRepositoryImpl({
    required this.networkInfo,
    required this.shopsRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<ShopEntity>>> getShops() async {
    if (await networkInfo.isConnected) {
      try {
        final List<ShopEntity> shops = await shopsRemoteDataSource.getShops();
        return Right(shops);
      } on ServerException {
        return Left(ServerFailure());
      } catch (e) {
        return Left(UnknownFailure());
      }
    } else {
      return Left(InternetConntectionFailure());
    }
  }
}
