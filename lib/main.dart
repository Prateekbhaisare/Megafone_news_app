import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:live_news/routes/routes.dart';
import 'package:live_news/data/local/hive_one.dart';
import 'package:live_news/data/local/hive_two.dart';

void main() async{
  debugDefaultTargetPlatformOverride = null;
  WidgetsFlutterBinding.ensureInitialized();
  await HiveStorageTwo.initHiveTwo();
  await HiveStorageOne.initHiveOne();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesName.splashScreen,
        onGenerateRoute: Routes.generateRoute,
      );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

    );
  }
}
