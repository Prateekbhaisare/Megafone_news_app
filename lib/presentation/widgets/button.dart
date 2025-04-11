import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget myButtonWidget({required String title, required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xff6713d2), Color(0xffcc208e)]),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
    );
  }

// Sign up With Button
  Widget signUpWithButton({required String signUpText, required IconData faIcon, required Color iconColor, required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(10),
          border:
          Border.all(color: Colors.grey.shade800, width: 1.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(faIcon, color: iconColor,),
          SizedBox(width: MediaQuery.of(context).size.width*0.02,),
          Text(
            signUpText,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ],
      ),
    );
  }

