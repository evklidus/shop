part of 'shops_bloc.dart';

abstract class ShopsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ShopsEmptyState extends ShopsState {}

class ShopsLoadingState extends ShopsState {}

class ShopsLoadedState extends ShopsState {
  final List<ShopEntity> shops;

  ShopsLoadedState({required this.shops});
}

class ShopsErrorState extends ShopsState {}
