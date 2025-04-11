import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:live_news/presentation/widgets/button.dart';
import 'package:live_news/presentation/widgets/my_text.dart';
import 'package:live_news/presentation/widgets/text_field.dart';
import 'package:live_news/presentation/views/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../routes/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff282828),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              myText(textTitle: 'Login to your', context: context),
              myText(textTitle: 'account', context: context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.037),
              const Text(
                'Your number & email address',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.008),
              myTextField(
                controllerName: emailController,
                hintText: 'Email',
                labelName: 'Email',
                preIcon: Icons.email,
                obscureText: false,
                context: context
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.018),
              const Text(
                'Enter your password',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.009),
              myTextField(
                controllerName: passwordController,
                labelName: 'Password',
                hintText: 'Password',
                preIcon: Icons.key,
                obscureText: true,
                context: context
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: rememberMe, onChanged: (value){
                        setState(() {
                          rememberMe = value!;
                        });
                      }),
                      Text(
                        'Remember me',
                        style: TextStyle(
                            color: Colors.grey.shade200, fontSize: 14),
                      ),
                    ],
                  ),
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Colors.purpleAccent.shade400, fontSize: 14),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.020),
              InkWell(onTap:() async{

                var sharedPref = await SharedPreferences.getInstance();
                sharedPref.setBool(SplashScreenState.keyNAME, true);

                Navigator.pushReplacementNamed(context, RoutesName.circularIndicator);

              }, child: myButtonWidget(title: 'Log In', context: context)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.018),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.001,
                      width: MediaQuery.of(context).size.width * 0.38,
                      color: Colors.grey),
                  const Text(
                    "Or",
                    style: TextStyle(
                        fontSize: 15, color: Colors.grey, fontFamily: 'ubuntu'),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.001,
                      width: MediaQuery.of(context).size.width * 0.38,
                      color: Colors.grey),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              signUpWithButton(
                signUpText: 'Sign up with Google',
                faIcon: FontAwesomeIcons.google,
                iconColor: Colors.green,
                context: context
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.018),
              signUpWithButton(
                signUpText: 'Sign up with Facebook',
                faIcon: FontAwesomeIcons.facebook,
                iconColor: Colors.blue.shade700,
                context: context
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade200),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context, RoutesName.createAccountScreen
                      );
                    },
                    child: Text(
                      'Create an account?',
                      style: TextStyle(
                          fontSize: 14, color: Colors.purpleAccent.shade400),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
