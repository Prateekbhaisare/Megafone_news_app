import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:live_news/presentation/widgets/button.dart';
import 'package:live_news/presentation/widgets/my_text.dart';
import 'package:live_news/presentation/widgets/text_field.dart';
import '../../routes/routes.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController createEmailController = TextEditingController();
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController createConfirmPasswordController = TextEditingController();
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
              SizedBox(height: MediaQuery.of(context).size.height*0.05),
              myText(textTitle: 'Create your', context: context),
              myText(textTitle: 'account', context: context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.037),
              const Text(
                'Your number & email address',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.008),
              myTextField(
                controllerName: createEmailController,
                hintText: 'Email',
                labelName: 'Email',
                preIcon: Icons.email,
                obscureText: false,
                context: context
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.018),
              const Text(
                'Enter your password',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.009),
              myTextField(
                controllerName: createPasswordController,
                hintText: 'Password',
                labelName: 'Password',
                preIcon: Icons.key,
                obscureText: true,
                context: context
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.018),
              const Text(
                'Confirm your password',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.008),
              myTextField(
                controllerName: createConfirmPasswordController,
                hintText: 'Confirm password',
                labelName: 'Confirm password',
                preIcon: Icons.key,
                obscureText: true,
                context: context
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.018),
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
                        style: TextStyle(color: Colors.grey.shade200, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.018),
              InkWell(child: myButtonWidget(title: 'Log In', context: context), onTap: (){
                Navigator.pushReplacementNamed(context, RoutesName.circularIndicator);
              },),
              SizedBox(height: MediaQuery.of(context).size.height * 0.018),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: MediaQuery.of(context).size.height*0.001, width: MediaQuery.of(context).size.width*0.38, color: Colors.grey.shade700),
                  const Text(
                    "Or",
                    style: TextStyle(fontSize: 15, color: Colors.grey, fontFamily: 'ubuntu'),
                  ),
                  Container(height: MediaQuery.of(context).size.height*0.001, width: MediaQuery.of(context).size.width*0.38, color: Colors.grey.shade700),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.017),
              signUpWithButton(
                signUpText: 'Sign up with Google',
                faIcon: FontAwesomeIcons.google,
                iconColor: Colors.green,
                context: context
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.018),
              signUpWithButton(
                signUpText: 'Sign up with Facebook',
                faIcon: FontAwesomeIcons.facebook, iconColor: Colors.blue.shade700,
                context: context
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade200),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RoutesName.loginScreen
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 14, color: Colors.purpleAccent.shade400),
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
