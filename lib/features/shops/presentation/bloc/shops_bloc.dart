import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop/features/shops/domain/usecases/get_shops.dart';
import 'package:shop/features/shops/domain/entities/shop_entity.dart';
import 'package:shop/utilities/get_filtered_data.dart';

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
      _filters = null;
    });
    on<SetFiltersShopsEvent>((event, emit) async {
      emit(ShopsLoadingState());
      final shopsOrFailure = await _getShops();
      emit(shopsOrFailure.fold(
        (failure) => ShopsErrorState(),
        (shops) {
          final List<ShopEntity>? filteredShops =
              filterShops(shops, event.name, event.weight);
          _filters = event;
          if (filteredShops != null) {
            return ShopsLoadedState(shops: filteredShops);
          } else {
            return ShopsEmptyState();
          }
        },
      ));
    });
    on<ResetFiltersShopsEvent>((event, emit) => add(LoadShopsEvent()));
  }

  SetFiltersShopsEvent? _filters;
  SetFiltersShopsEvent? get filters => _filters;

  bool get filtersSetted => filters != null;
}
