import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget settingsList({required Color circleAvatarBgColor, required IconData circleAvatarIcon, required String listText, IconData? trailing, required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: Colors.grey.shade900,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: circleAvatarBgColor,
                  radius: 20,
                  child: FaIcon(circleAvatarIcon, color: Colors.white,),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.035,),
                Text(listText, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade200, fontSize: 17),)
              ],
            ),
            Icon(trailing, color: Colors.grey.shade700,)
          ],
        ),
      ),
    );
  }

