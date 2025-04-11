import 'package:flutter/material.dart';

  Widget myText({required String textTitle, required BuildContext context}) {
    return Text(
      textTitle,
      style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          fontFamily: 'ubuntu',
          color: Colors.white),
    );
  }

