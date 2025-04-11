
import 'package:hive_flutter/hive_flutter.dart';
import 'package:live_news/data/models/model/home_model_two.dart';
class HiveStorageTwo{
  static Future<void> initHiveTwo() async{
    await Hive.initFlutter();
    Hive.registerAdapter(ArticleModelTwoAdapter());
    await Hive.openBox<ArticleModelTwo>('Hive_Storage_Two');
  }
}
