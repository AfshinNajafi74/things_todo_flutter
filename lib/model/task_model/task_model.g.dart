// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 0;

  @override
  TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModel(
      title: fields[0] as String?,
      description: fields[1] as String?,
      category: fields[2] as String?,
      pickDate: fields[3] as DateTime?,
      hour: fields[4] as int,
      minute: fields[5] as int,
      color: fields[6] as int,
      day: fields[7] as int,
      isDone: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.pickDate)
      ..writeByte(4)
      ..write(obj.hour)
      ..writeByte(5)
      ..write(obj.minute)
      ..writeByte(6)
      ..write(obj.color)
      ..writeByte(7)
      ..write(obj.day)
      ..writeByte(8)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
