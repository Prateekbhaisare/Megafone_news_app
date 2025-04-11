import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget subscriptionShimmerEffect(){
  return Shimmer.fromColors(
    enabled: true,
    baseColor: Colors.grey.shade400,
    highlightColor: Colors.grey.shade100,
    child: ListView.builder(
      itemCount: 13,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
          ),
          title: Container(
            color: Colors.white,
            height: 10,
            width: double.infinity,
          ),
          subtitle: Container(
            color: Colors.white,
            height: 10,
            width: double.infinity,
          ),
        );
      },
    ),
  );
}