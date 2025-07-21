import 'package:flutter/material.dart';
import 'package:mindset_firstproject/home_screen.dart';
import 'package:mindset_firstproject/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/loginScreen",
      // routes: {
      //   '/loginScreen': (context) => LoginScreen(),
      //   '/homeScreen': (context) => HomeScreen()
      // },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/loginScreen':
            return MaterialPageRoute(builder: (_) => LoginScreen());

          case '/homeScreen':
            final args = settings.arguments as String;
            return MaterialPageRoute(
                builder: (_) => HomeScreen(
                      userName: args,
                    ));
          default:
            return null;
        }
      },
    );
  }
}
