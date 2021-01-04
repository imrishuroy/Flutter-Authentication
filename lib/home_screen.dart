import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:register_login_flutter_app/register_screen.dart';
import 'package:register_login_flutter_app/success_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  //   super.initState();
  //   initialiseFirebase();
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          return SuccusScreen();
        } else {
          return RegisterScreen();
        }
      },
    );
  }
}
