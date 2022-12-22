import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shop/features/shops/data/datasources/shops_local_datasource.dart';

import 'package:shop/features/shops/data/datasources/shops_remote_datasource.dart';
import 'package:shop/features/shops/data/repositories/shops_repository_impl.dart';
import 'package:shop/features/shops/domain/repositories/shops_repository.dart';
import 'package:shop/features/shops/domain/usecases/get_shops.dart';
import 'package:shop/features/shops/presentation/bloc/shops_bloc.dart';
import 'package:shop/services/db/hive_db.dart';
import 'package:shop/services/http/http_service.dart';
import 'package:shop/services/http/network_info.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // Bloc
  getIt.registerFactory(
    () => ShopsBloc(getIt()),
  );

  // Use cases
  getIt.registerLazySingleton<GetShops>(() => GetShops(getIt()));

  // Repository
  getIt.registerLazySingleton<ShopsRepository>(
    () => ShopsRepositoryImpl(
      networkInfo: getIt(),
      shopsRemoteDataSource: getIt(),
      shopsLocalDataSource: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<ShopsRemoteDataSource>(
    () => ShopsRemoteDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<ShopsLocalDataSource>(
    () => ShopsLocalDataSourceImpl(getIt()),
  );

  // Services
  final hiveDB = HiveDB();
  await hiveDB.init();
  getIt.registerLazySingleton<Database>(() => hiveDB);

  final InternetConnectionChecker internetConnectionChecker =
      InternetConnectionChecker();
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker));

  getIt.registerLazySingleton<HttpService>(() => HttpServiceImpl());
}
