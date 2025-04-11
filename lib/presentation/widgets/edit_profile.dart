import 'package:flutter/material.dart';

  Future<void> showEditProfileWidget (BuildContext context) async {
    TextEditingController updateNewEmail = TextEditingController();
    TextEditingController updateNewPassword = TextEditingController();

    await showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text('Change email and password'),
        actions: [
          TextField(
            controller: updateNewEmail,
            decoration: InputDecoration(
              hintText: 'Enter your new email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.purple.shade400, width: 1.5),
              ),
            ),
          ),
          const SizedBox(height: 15,),
          TextField(
            controller: updateNewPassword,
            decoration: InputDecoration(
              hintText: 'Enter your new password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.purple.shade400, width: 1.5),
              ),
            ),
          ),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {
                // var sharedPref = await SharedPreferences.getInstance();
                // sharedPref.setString(SplashscreenState.KEYNAME, updateNewEmail as String);
                Navigator.pop(context);
              }, child: const Text('Update')),
              TextButton(onPressed: () {
                Navigator.pop(context);
              },
                  child: Text(
                    'cancel', style: TextStyle(color: Colors.grey.shade500),)),
            ],
          ),

        ],
      );
    });
  }

