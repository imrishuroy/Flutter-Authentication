import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:register_login_flutter_app/home_screen.dart';
import 'package:register_login_flutter_app/login_screen.dart';
import 'package:register_login_flutter_app/register_screen.dart';
import 'package:register_login_flutter_app/success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // void initialiseFirebase() async {
  //   try {
  //     await Firebase.initializeApp();
  //   } catch (error) {
  //     print(error);
  //     setState(() {});
  //   }
  // }

  // @override
  // void initState() {
  //   initialiseFirebase();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        backgroundColor: Colors.pink,
        accentColor: Colors.purple,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
            buttonColor: Colors.pink,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),

      // StreamBuilder(stream: FirebaseAuth.instance.authStateChanges().listen((event) {

      // }),),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SuccusScreen.routeName: (ctx) => SuccusScreen(),
      },
    );
  }
}
