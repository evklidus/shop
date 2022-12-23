part of 'shops_bloc.dart';

abstract class ShopsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadShopsEvent extends ShopsEvent {}

class SetFiltersShopsEvent extends ShopsEvent {
  final String name;
  final int weight;

  SetFiltersShopsEvent({
    required this.name,
    required this.weight,
  });
}

class ResetFiltersShopsEvent extends ShopsEvent {}
