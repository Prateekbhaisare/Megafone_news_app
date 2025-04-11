
import 'package:hive/hive.dart';
part '../adapter/home_model_two.g.dart';

@HiveType(typeId: 0)
class ArticleModelTwo{
  
  @HiveField(0)
  String? titleTwo;
  @HiveField(1)
  String? descriptionTwo;
  @HiveField(2)
  String? urlToImageTwo;

  ArticleModelTwo({this.titleTwo, this.descriptionTwo, this.urlToImageTwo});

  // ye function json format k data ko dart object me convert Karega
  factory ArticleModelTwo.fromJson(Map<String, dynamic> json) {
    return ArticleModelTwo(
      titleTwo: json['title'],
      descriptionTwo: json['description'],
      urlToImageTwo: json['urlToImage'],
    );
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = titleTwo;
    data['description'] = descriptionTwo;
    data['urlToImage'] = urlToImageTwo;
    return data;
  }

}