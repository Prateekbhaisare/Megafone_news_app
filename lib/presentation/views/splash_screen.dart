import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  static const String keyNAME = 'Login';

  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    whereToGo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff282828),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                'assets/images/megafon_news.jpg',
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width * 0.38,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Text(
              "Megafon News",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void whereToGo() async{

    var sharedPref = await SharedPreferences.getInstance();

    var isLoggedIn = sharedPref.getBool(keyNAME);

    Timer(const Duration(seconds: 3), (){

      if(isLoggedIn != null){
        if(isLoggedIn){
          Navigator.pushReplacementNamed(context, RoutesName.circularIndicator);
        }
        else{
          Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
        }
      }
      else{
        Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
      }

    });
  }

}
