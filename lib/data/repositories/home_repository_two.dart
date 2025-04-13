
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import '../models/model/home_model_two.dart';
import 'package:http/http.dart' as http;
// const String APIKEY = '92db6e64fa274d74a61d50776ab09b2d';

class HomeRepositoryTwo{

  final String _boxStorage = 'Hive_Storage_Two';

  Future<List<ArticleModelTwo>> fetchListTwo() async{

    try{
      final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2025-03-13&sortBy=publishedAt&apiKey=92db6e64fa274d74a61d50776ab09b2d'
      ));
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        var articles = data['articles'] as List;

        if (articles.isEmpty) {
          throw Exception('No articles found in API response.');
        }

        List<ArticleModelTwo> articleListTwo = articles.map((e){
          return ArticleModelTwo(
            titleTwo: e['title'] ?? 'No Title',
            descriptionTwo: e['description'] ?? 'No Description',
            urlToImageTwo: e['urlToImage'] ?? 'Image Not Found',
          );
        }).toList();

        // hive ka box create kia
        var box = await getBox();
        await box.clear();
        await box.addAll(articleListTwo);
        return articleListTwo;

      }
      else{
        throw Exception('failed to load: ${response.statusCode}');
      }
    } on SocketException{
      // agar net on nhi he toh data hive se aajyga
      var box = await getBox();
      var cachedData = box.values.toList();
      if(cachedData.isEmpty){
        throw Exception('Cached data is not available');
      }
      else{
        return cachedData;
      }
      // throw Exception('internet out');
    } on TimeoutException{
      throw Exception('Connection timeout');
    }
    // throw Exception('Data not found');
  }

  Future<Box<ArticleModelTwo>> getBox() async{
    if(!Hive.isBoxOpen(_boxStorage)){
      return await Hive.openBox<ArticleModelTwo>(_boxStorage);
    }
    return Hive.box<ArticleModelTwo>(_boxStorage);
  }

}