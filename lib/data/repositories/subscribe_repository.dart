
import '../models/model/subscribe_item_model.dart';

class SubscribeRepository{

  Future<List<SubscribeItemsModel>> fetchData() async{
    await Future.delayed(const Duration(seconds: 5));
    return generateList();
  }

  List<SubscribeItemsModel> generateList(){

    List<Map<String, dynamic>> newsData = [
      {'image': 'assets/images/BBCNews.jpeg', 'name': 'BCC News', 'desc' : 'Watch the Latest News Headlines'},
      {'image': 'assets/images/DWNews.jpeg', 'name': 'DW News', 'desc' : 'Top Most Popular News Channel'},
      {'image': 'assets/images/ABCNews.jpeg', 'name': 'ABC News', 'desc' : 'ABC News is a Popular News Channel'},
      {'image': 'assets/images/NBC_news.jpeg', 'name': 'NBC News', 'desc' : 'Watch the Latest News Headlines'},
      {'image': 'assets/images/universal_channel.jpeg', 'name': 'Universal News', 'desc' : 'Watch the Latest News Headlines'},
      {'image': 'assets/images/ETDNews.jpeg', 'name': 'ETD News', 'desc' : 'ETD News is a International News'},
      {'image': 'assets/images/foxNews.jpeg', 'name': 'Fox News', 'desc' : 'Fox News is Most Popular News Channel'},
      {'image': 'assets/images/NRYNews.jpeg', 'name': 'NRY News', 'desc' : 'Watch the Latest News Headlines'},
      {'image': 'assets/images/TechNews.jpeg', 'name': 'Tech News', 'desc' : 'Tech News is a International  News'},
      {'image': 'assets/images/WorldNews.jpeg', 'name': 'World News', 'desc' : 'Top Most Popular News Channel'},
      {'image': 'assets/images/ZeeNews.jpeg', 'name': 'Zee News', 'desc' : 'Watch the Latest News Headlines'},
      {'image': 'assets/images/ABPNews.jpeg', 'name': 'ABP News', 'desc' : 'Top Most Popular News Channel'},
      {'image': 'assets/images/AajTak.jpeg', 'name': 'AajTak News', 'desc' : 'Watch the Latest News Headlines'},
    ];

    return newsData.map((data){
      return SubscribeItemsModel(newsImage: data['image']!, channelName: data['name']!, channelDesc: data['desc']);
    }).toList();
  }

}