import 'package:flutter/material.dart';
import 'package:flutter_application/models/user.dart';
import 'package:flutter_application/views/loginPage.dart';

class mainPage extends StatefulWidget {
  final User user;

  const mainPage({super.key, required this.user});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PawPal Home'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 100, color: Colors.blueAccent),
            const SizedBox(height: 20),
            const Text("Welcome to PawPal", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),

            Text(
              widget.user.userId == '0'
                  ? "Guest"
                  : widget.user.userName.toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),

            Text(
              widget.user.userId == '0'
                  ? "guest@email.com"
                  : widget.user.userEmail.toString(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),

            if (widget.user.userId != '0')
              Text(
                "Phone: ${widget.user.userPhone.toString()}",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
          ],
        ),
      ),

      // 5. The Gatekeeper Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // LOGIC: Check if user is Guest (ID 0) or Registered User
          if (widget.user.userId == '0') {
            // SCENARIO A: GUEST
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Please login first to proceed"),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 2),
              ),
            );

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Verified: You are logged in as ${widget.user.userName}",
                ),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
              ),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
