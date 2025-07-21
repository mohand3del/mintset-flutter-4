import 'package:flutter/material.dart';

import 'shared_prefs_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = '';
  void loadUsername() async {
    String? storedUsername = await SharedPrefsHelper.getUsername();
    if (storedUsername != null) {
      setState(() {
        username = storedUsername;
      });
    }
   
  }

  @override
  void initState() {
    super.initState();
    loadUsername();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('Welcome $username !'),
      ),
    );
  }
}
