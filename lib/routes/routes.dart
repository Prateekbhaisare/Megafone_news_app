import 'package:flutter/material.dart';
import '../presentation/views/bottom_navigationbar.dart';
import '../presentation/views/circular_indicator.dart';
import '../presentation/views/create_account_screen.dart';
import '../presentation/views/getstarted.dart';
import '../presentation/views/home_screen.dart';
import '../presentation/views/login_screen.dart';
import '../presentation/views/profile_screen.dart';
import '../presentation/views/search_screen.dart';
import '../presentation/views/splash_screen.dart';
import '../presentation/views/subscription_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
        case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
        case RoutesName.createAccountScreen:
        return MaterialPageRoute(builder: (context) => const CreateAccountScreen());
        case RoutesName.bottomNavigationBarScreen:
        return MaterialPageRoute(builder: (context) => const BottomNavigationBarScreen());
        case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
        case RoutesName.subscriptionScreen:
        return MaterialPageRoute(builder: (context) => const SubscriptionScreen());
        case RoutesName.searchScreen:
        return MaterialPageRoute(builder: (context) => const SearchScreen());
        case RoutesName.profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
        case RoutesName.getStarted:
        return MaterialPageRoute(builder: (context) => const GetStarted());
        case RoutesName.circularIndicator:
        return MaterialPageRoute(builder: (context) => const CircularIndicator());
      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
            body: Center(child: Text('No route generated'),),
          );
        });
    }

  }
}

class RoutesName{

  static const String splashScreen = 'splash_screen';
  static const String loginScreen = 'login_screen';
  static const String createAccountScreen = 'create_account_screen';
  static const String bottomNavigationBarScreen = 'bottom_navigation';
  static const String homeScreen = 'home_screen';
  static const String subscriptionScreen = 'subscription_screen';
  static const String searchScreen = 'search_screen';
  static const String profileScreen = 'profile_screen';
  static const String getStarted = 'get_started';
  static const String circularIndicator = 'circular_indicator';

}