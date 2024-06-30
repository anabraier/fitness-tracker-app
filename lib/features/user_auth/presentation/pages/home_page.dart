import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_tracker_app/global/common/utils.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomePage")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to Fitness Tracker!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, "/login");
                showSnackBar(context, "Successfully logged out");
              },
              child: Container(
                height: 45,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Center(
                  child: Text(
                    "Sign out",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
