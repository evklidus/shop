import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop/features/shops/domain/usecases/get_shops.dart';
import 'package:shop/features/shops/domain/entities/shop_entity.dart';

part 'shops_event.dart';
part 'shops_state.dart';

class ShopsBloc extends Bloc<ShopsEvent, ShopsState> {
  final GetShops _getShops;

  ShopsBloc(this._getShops) : super(ShopsEmptyState()) {
    on<LoadShopsEvent>((event, emit) async {
      emit(ShopsLoadingState());
      final shopsOrFailure = await _getShops();
      emit(shopsOrFailure.fold(
        (failure) => ShopsErrorState(),
        (shops) => ShopsLoadedState(shops: shops),
      ));
    });
  }
}
