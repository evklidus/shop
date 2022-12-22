part of 'shops_bloc.dart';

abstract class ShopsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadShopsEvent extends ShopsEvent {}
