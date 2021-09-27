// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'difficulty.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DifficultyAdapter extends TypeAdapter<Difficulty> {
  @override
  final int typeId = 2;

  @override
  Difficulty read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Difficulty.easy;
      case 1:
        return Difficulty.normal;
      case 2:
        return Difficulty.hard;
      case 3:
        return Difficulty.intense;
      default:
        return Difficulty.easy;
    }
  }

  @override
  void write(BinaryWriter writer, Difficulty obj) {
    switch (obj) {
      case Difficulty.easy:
        writer.writeByte(0);
        break;
      case Difficulty.normal:
        writer.writeByte(1);
        break;
      case Difficulty.hard:
        writer.writeByte(2);
        break;
      case Difficulty.intense:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DifficultyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
