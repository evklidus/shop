import 'package:dartz/dartz.dart';
import 'package:shop/core/errors/failure.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}

abstract class UseCaseWithParams<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
