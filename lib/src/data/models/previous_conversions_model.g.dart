// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'previous_conversions_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PreviousConversionModelAdapter
    extends TypeAdapter<PreviousConversionModel> {
  @override
  final int typeId = 0;

  @override
  PreviousConversionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PreviousConversionModel(
      date: fields[0] as String?,
      sourceCurrency: fields[1] as CurrencyModel?,
      targetCurrency: fields[2] as CurrencyModel?,
      sourceValue: fields[3] as double?,
      targetValue: fields[4] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, PreviousConversionModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.sourceCurrency)
      ..writeByte(2)
      ..write(obj.targetCurrency)
      ..writeByte(3)
      ..write(obj.sourceValue)
      ..writeByte(4)
      ..write(obj.targetValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreviousConversionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
