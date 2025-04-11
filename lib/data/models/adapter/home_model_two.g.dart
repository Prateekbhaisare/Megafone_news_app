part of '../model/home_model_two.dart';


class ArticleModelTwoAdapter extends TypeAdapter<ArticleModelTwo> {
  @override
  final int typeId = 0;

  @override
  ArticleModelTwo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleModelTwo(
      titleTwo: fields[0] as String?,
      descriptionTwo: fields[1] as String?,
      urlToImageTwo: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ArticleModelTwo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.titleTwo)
      ..writeByte(1)
      ..write(obj.descriptionTwo)
      ..writeByte(2)
      ..write(obj.urlToImageTwo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleModelTwoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
