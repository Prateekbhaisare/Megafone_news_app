import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import '../models/model/home_model_one.dart';
class HomeRepositoryOne{
  final String _boxStorage = 'Hive_Storage_One';
    Future<List<ArticleModelOne>> fetchList() async{
      try{
        final response = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=apple&from=2025-04-12&to=2025-04-12&sortBy=popularity&apiKey=92db6e64fa274d74a61d50776ab09b2d'));
        if(response.statusCode == 200){
          final data = jsonDecode(response.body);
          final articles = data['articles'] as List;
          List<ArticleModelOne> articleListOne = articles.map((e){
            return ArticleModelOne(title: e['title']?.toString() ?? 'No title',
              description: e['description']?.toString() ?? 'No description',
              urlToImage: e['urlToImage']?.toString() ?? "Image Not Found",
            );
          }).toList();

          final box = await getBox();
          await box.clear();
          await box.addAll(articleListOne);
          return articleListOne;
        }
        else{
          throw Exception("failed to load: ${response.statusCode}");
        }

      } on SocketException{
        var box = await getBox();
        final cachedData =  box.values.toList();

        if(cachedData.isEmpty){
          throw Exception('cached data is not available');
        }
        return cachedData;

        // throw Exception('Error while fetching data');
      } on TimeoutException{
        throw Exception('Connection time out');
      }
      // throw Exception('unimplemented errors');
  }
  
  Future<Box<ArticleModelOne>> getBox() async{
      if(!Hive.isBoxOpen(_boxStorage)){
        return await Hive.openBox<ArticleModelOne>(_boxStorage);
      }
      return Hive.box<ArticleModelOne>(_boxStorage);
  }

}