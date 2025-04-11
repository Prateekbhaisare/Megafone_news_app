import 'package:flutter/material.dart';

Widget myTextField(
    {required TextEditingController controllerName,
    required String hintText,
    required IconData? preIcon,
    required bool obscureText,
    required String labelName,
    required BuildContext context}) {
  return TextField(
    controller: controllerName,
    obscureText: obscureText,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: hintText,
      label: Text(labelName),
      prefixIcon: Icon(
        preIcon,
        color: Colors.grey.shade700,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.purple.shade400, width: 1.5),
      ),
    ),

  );
}
