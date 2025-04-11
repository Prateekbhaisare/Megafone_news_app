import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../routes/routes.dart';

  @override
  Widget taskButton({required IconData iconName, required BuildContext context}) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(30)),
      child: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
                context,
                RoutesName.bottomNavigationBarScreen);
          },
          icon: FaIcon(iconName, color: Colors.grey.shade400,)),
    );
  }

