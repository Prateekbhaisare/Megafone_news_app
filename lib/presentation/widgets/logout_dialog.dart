import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../routes/routes.dart';
import '../views/splash_screen.dart';

  Widget logoutDialog({bool isDelete = false, required BuildContext context}) {
    return AlertDialog(
      title: Text(
        isDelete
            ? 'Really, do you want to delete your account ?'
            : 'Do you want to logout your account ?',
        style: const TextStyle(fontSize: 20),
      ),
      actions: [
        TextButton(
            onPressed: () async {
              var sharedPref = await SharedPreferences.getInstance();
              if (isDelete) {
                await sharedPref.clear();
              } else {
                sharedPref.setBool(SplashScreenState.keyNAME, false);
              }
              Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen,
                    (Route<dynamic> route) => false, //saare routes ko remove krdega
              );
            },
            child: Text(
              isDelete ? 'Delete' : 'Yes',
              style: TextStyle(color: Colors.grey.shade500),
            )),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'))
      ],
    );
  }

