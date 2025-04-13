import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:shimmer/shimmer.dart';
import '../view_models/home/home_screen_state.dart';

Widget trendingNews(HomeScreenState state, BuildContext context) {
  return KeyboardVisibilityProvider(
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.36,
      child: Center(
        child: state.searchMessage.isNotEmpty ? Text(state.searchMessage.toString(), style: TextStyle(color: Colors.grey.shade200),) : ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.tempSearchList.isEmpty ? state.articleModel.length : state.tempSearchList.length,
          itemBuilder: (context, index) {
            if(state.tempSearchList.isNotEmpty){
              final item = state.tempSearchList[index];
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.47,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            item.urlToImage.toString(),
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                      : null,
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Shimmer.fromColors(
                                enabled: true,
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade300,
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.2,
                                  width: double.infinity,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.title.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'ubuntu',
                              color: Colors.grey.shade200
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item.description.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400,
                            fontFamily: 'ubuntu',
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            else{
              final item = state.articleModel[index];
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.47,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            item.urlToImage.toString(),
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                      : null,
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Shimmer.fromColors(
                                enabled: true,
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade300,
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.2,
                                  width: double.infinity,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.title.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'ubuntu',
                              color: Colors.grey.shade200
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item.description.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400,
                            fontFamily: 'ubuntu',
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    ),
  );
}
