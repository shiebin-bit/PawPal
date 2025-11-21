import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application/views/mainpage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application/myconfig.dart';
import 'package:flutter_application/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splashPage extends StatefulWidget {
  const splashPage({super.key});

  @override
  State<splashPage> createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    autologin();
  }

  void autologin() {
    SharedPreferences.getInstance().then((prefs) {
      bool? rememberMe = prefs.getBool('rememberMe');
      if (rememberMe != null && rememberMe) {
        email = prefs.getString('email') ?? 'NA';
        password = prefs.getString('password') ?? 'NA';
        http
            .post(
              Uri.parse(
                '${MyConfig.baseUrl}/assignment_2/server/api/login_user.php',
              ),
              body: {'email': email, 'password': password},
            )
            .then((response) {
              if (response.statusCode == 200) {
                var jsonResponse = response.body;
                // print(jsonResponse);
                var resarray = jsonDecode(jsonResponse);
                if (resarray['status'] == 'success') {
                  User user = User.fromJson(resarray['data'][0]);
                  if (!mounted) return;
                  Future.delayed(Duration(seconds: 2), () {
                    if (!mounted) return;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => mainPage(user: user),
                      ),
                    );
                  });
                } else {
                  Future.delayed(Duration(seconds: 3), () {
                    if (!mounted) return;
                    User user = User(
                      userId: '0',
                      userEmail: 'guest@email.com',
                      userPassword: 'guest',
                      userRegdate: '0000-00-00',
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => mainPage(user: user),
                      ),
                    );
                  });
                }
              } else {
                Future.delayed(Duration(seconds: 3), () {
                  if (!mounted) return;
                  User user = User(
                    userId: '0',
                    userEmail: 'guest@email.com',
                    userPassword: 'guest',
                    userRegdate: '0000-00-00',
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => mainPage(user: user),
                    ),
                  );
                });
              }
            });
      } else {
        Future.delayed(Duration(seconds: 3), () {
          if (!mounted) return;
          User user = User(
            userId: '0',
            userEmail: 'guest@email.com',
            userPassword: 'guest',
            userRegdate: '0000-00-00',
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => mainPage(user: user)),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/assignment_2.jpeg', scale: 3),
            SizedBox(height: 20),
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Loading...'),
            SizedBox(height: 20),
            Text('Please wait...'),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
