import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';
import 'shared_prefs_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final  _usernameController = TextEditingController();

  void login() async {
    SharedPrefsHelper.setLoggedIn(true);

    SharedPrefsHelper.setUsername(_usernameController.text);
    if (!mounted) return;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text("Welcome to the Login Screen!"),
              const SizedBox(height: 16.0),
              TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person_2_outlined),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  }),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.key_outlined),
                    suffixIcon: Icon(Icons.visibility_off_outlined)),
                obscureText: true,
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    log(_usernameController.text);
                    log(SharedPrefsHelper.getUsername().toString());
                    login();
                  },
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
