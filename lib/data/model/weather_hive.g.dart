// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherHiveAdapter extends TypeAdapter<WeatherHive> {
  @override
  final int typeId = 0;

  @override
  WeatherHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherHive(
      country: fields[12] as String?,
      feelslike: fields[8] as int?,
      humidity: fields[7] as int?,
      isDay: fields[1] as String?,
      localtime: fields[10] as String?,
      name: fields[11] as String?,
      pressure: fields[6] as int?,
      temperature: fields[2] as int?,
      visibility: fields[9] as int?,
      weatherDescriptions: (fields[0] as List?)?.cast<String>(),
      weatherIcons: (fields[3] as List?)?.cast<String>(),
      windDir: fields[5] as String?,
      windSpeed: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherHive obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.weatherDescriptions)
      ..writeByte(1)
      ..write(obj.isDay)
      ..writeByte(2)
      ..write(obj.temperature)
      ..writeByte(3)
      ..write(obj.weatherIcons)
      ..writeByte(4)
      ..write(obj.windSpeed)
      ..writeByte(5)
      ..write(obj.windDir)
      ..writeByte(6)
      ..write(obj.pressure)
      ..writeByte(7)
      ..write(obj.humidity)
      ..writeByte(8)
      ..write(obj.feelslike)
      ..writeByte(9)
      ..write(obj.visibility)
      ..writeByte(10)
      ..write(obj.localtime)
      ..writeByte(11)
      ..write(obj.name)
      ..writeByte(12)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
