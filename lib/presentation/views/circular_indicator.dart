import 'package:flutter/material.dart';
import '../../routes/routes.dart';

class CircularIndicator extends StatefulWidget {
  const CircularIndicator({super.key});

  @override
  State<CircularIndicator> createState() => _CircularIndicatorState();
}

class _CircularIndicatorState extends State<CircularIndicator> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, RoutesName.bottomNavigationBarScreen);
    });
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff282828),
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}
