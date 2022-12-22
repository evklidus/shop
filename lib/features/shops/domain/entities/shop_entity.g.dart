// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShopEntityAdapter extends TypeAdapter<ShopEntity> {
  @override
  final int typeId = 2;

  @override
  ShopEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShopEntity(
      id: fields[0] as int,
      name: fields[1] as String,
      products: (fields[2] as List).cast<ProductEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, ShopEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.products);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
