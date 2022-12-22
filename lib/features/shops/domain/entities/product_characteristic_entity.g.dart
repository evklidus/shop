// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_characteristic_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductCharacteristicEntityAdapter
    extends TypeAdapter<ProductCharacteristicEntity> {
  @override
  final int typeId = 0;

  @override
  ProductCharacteristicEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductCharacteristicEntity(
      id: fields[0] as int,
      weight: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProductCharacteristicEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductCharacteristicEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
