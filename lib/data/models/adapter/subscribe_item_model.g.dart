part of '../model/subscribe_item_model.dart';

class SubscribeItemsModelAdapter extends TypeAdapter<SubscribeItemsModel> {
  @override
  final int typeId = 2;

  @override
  SubscribeItemsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubscribeItemsModel(
      newsImage: fields[0] as String,
      channelName: fields[1] as String,
      channelDesc: fields[2] as String,
      isSubscribe: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SubscribeItemsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.newsImage)
      ..writeByte(1)
      ..write(obj.channelName)
      ..writeByte(2)
      ..write(obj.channelDesc)
      ..writeByte(3)
      ..write(obj.isSubscribe);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubscribeItemsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
