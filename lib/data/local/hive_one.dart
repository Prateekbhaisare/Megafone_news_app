import 'package:hive_flutter/hive_flutter.dart';
import 'package:live_news/data/models/model/home_model_one.dart';

class HiveStorageOne{
  static Future<void> initHiveOne() async{
    await Hive.initFlutter();
    Hive.registerAdapter(ArticleModelOneAdapter());
    await Hive.openBox<ArticleModelOne>('Hive_Storage_One');
  }
}