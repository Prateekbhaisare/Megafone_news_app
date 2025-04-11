import 'package:flutter/material.dart';
import '../widgets/searchbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Map<String, dynamic>> categoryList = [
    {'image': 'assets/images/businessCategory.jpeg', 'category': 'Business'},
    {'image': 'assets/images/crimeCategory.jpeg', 'category': 'Crime'},
    {'image': 'assets/images/educationCategory.jpeg', 'category': 'Education'},
    {
      'image': 'assets/images/entertainmentCategory.jpeg',
      'category': 'Entertainment'
    },
    {
      'image': 'assets/images/environmentalCategory.jpeg',
      'category': 'Environmental'
    },
    {'image': 'assets/images/healthCategory.jpeg', 'category': 'Health'},
    {'image': 'assets/images/localCategory.jpeg', 'category': 'Local'},
    {'image': 'assets/images/politicalCategory.jpeg', 'category': 'Political'},
    {'image': 'assets/images/scienceCategory.jpeg', 'category': 'Science'},
    {'image': 'assets/images/sportsCategory.jpeg', 'category': 'Sports'},
    {
      'image': 'assets/images/technologyCategory.jpeg',
      'category': 'Technology'
    },
    {'image': 'assets/images/travelCategory.jpeg', 'category': 'Travel'},
    {'image': 'assets/images/weatherCategory.jpeg', 'category': 'Weather'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff121212),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchBarWidget(hintText: 'Search news here...', suffixIcon: Icons.mic_none),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade200
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 40,
                              mainAxisSpacing: 20),
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image.asset(
                                categoryList[index]['image'],
                                height: MediaQuery.of(context).size.height * 0.19,
                                width: MediaQuery.of(context).size.width * 0.4,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.19,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  color: Colors.black38),
                              child: Center(
                                child: Text(
                                  categoryList[index]['category'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
