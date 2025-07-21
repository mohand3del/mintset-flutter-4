import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final String? userName;
  final TextEditingController userController = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey<FormState>();
  Future<void> saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
  }

  Future<void> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.getString('userName');
  }

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 45, right: 45),
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userController.text,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff505050)),
              ),
              SizedBox(
                height: 34,
              ),
              TextFormField(
                controller: userController,
                decoration: InputDecoration(
                  label: Text("Username"),
                  hintText: "Username",
                  labelStyle: TextStyle(color: Color(0xff838383)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "reqiured field";
                  }
                },
              ),
              SizedBox(
                height: 52,
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Password"),
                  hintText: "Password",
                  labelStyle: TextStyle(color: Color(0xff838383)),
                ),
              ),
              SizedBox(
                height: 64,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 44,
                  width: 150,
                  child: ElevatedButton(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff7795FF),
                      padding: EdgeInsets.symmetric(
                        horizontal: 56,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      if (key.currentState!.validate()) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Success")));
                        Navigator.pushNamed(
                          context,
                          "/homeScreen",
                          arguments: userController.text,
                        );
                        await saveUserName(userController.text);
                        await getUserName();
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Error")));
                      }
                      print("$userController");
                    },
                  ),
                ),
              ),
              Image.asset(
                "assets/images/photo_2.jpg",
                height: 100,
                width: 100,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
