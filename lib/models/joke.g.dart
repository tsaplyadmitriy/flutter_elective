// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JokeAdapter extends TypeAdapter<Joke> {
  @override
  final int typeId = 1;

  @override
  Joke read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Joke(
      icon_url: fields[0] as String?,
      id: fields[1] as String?,
      url: fields[2] as String?,
      value: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Joke obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.icon_url)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JokeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Joke _$JokeFromJson(Map<String, dynamic> json) => Joke(
      icon_url: json['icon_url'] as String?,
      id: json['id'] as String?,
      url: json['url'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$JokeToJson(Joke instance) => <String, dynamic>{
      'icon_url': instance.icon_url,
      'id': instance.id,
      'url': instance.url,
      'value': instance.value,
    };
