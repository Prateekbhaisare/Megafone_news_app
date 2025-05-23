part of '../model/home_model_one.dart';

class ArticleModelOneAdapter extends TypeAdapter<ArticleModelOne> {
  @override
  final int typeId = 1;

  @override
  ArticleModelOne read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleModelOne(
      title: fields[0] as String?,
      description: fields[1] as String?,
      urlToImage: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ArticleModelOne obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.urlToImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleModelOneAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
