import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:register_login_flutter_app/success_screen.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login-screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void login() async {
    if (_formKey.currentState.validate()) {
      print(_emailController.text);
      print(_passwordController.text);
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text);
        print(userCredential);
        Navigator.pushNamed(context, SuccusScreen.routeName);
        if (userCredential != null) {
          //Navigator.pushReplacementNamed(context, SuccusScreen.routeName);
          // Navigator.pushNamed(context, SuccusScreen.routeName);
        }
      } on FirebaseAuthException catch (error) {
        if (error.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (error.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      } catch (error) {
        print(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Container(
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 15.0,
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      validator: (value) =>
                          !(value.contains('@')) ? 'Invalid Input' : null,
                      decoration: InputDecoration(
                        icon: Icon(Icons.mail),
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 15.0,
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      validator: (value) =>
                          value.length < 6 ? 'Password too short' : null,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      login();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
