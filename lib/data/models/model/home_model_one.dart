import 'package:hive/hive.dart';

part '../adapter/home_model_one.g.dart';

@HiveType(typeId: 1)
class ArticleModelOne{
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  String? urlToImage;

  ArticleModelOne({this.title, this.description, this.urlToImage});

  // Json data ko dart object me convert kr rha he

  ArticleModelOne.fromJson(Map<String, dynamic> json){
    title = json['title'];
    description = json['description'];
    urlToImage = json['urlToImage'];
  }

  // Dart object ko json data me convert kr rha he
  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['urlToImage'] = urlToImage;
    return data;
  }

}