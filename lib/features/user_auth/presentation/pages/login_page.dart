import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_tracker_app/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:fitness_tracker_app/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:fitness_tracker_app/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:fitness_tracker_app/global/common/utils.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isSigning = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              FormContainerWidget(
                controller: _emailController,
                hintText: "Email",
                isPasswordField: false,
              ),
              const SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: _passwordController,
                hintText: "Password",
                isPasswordField: true,
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Future<bool> result = _signIn(context);
                  if (result == true) {
                    showSnackBar(context, "User is successfully logged in");
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: _isSigning
                        ? const CircularProgressIndicator(
                            color: Colors.white
                          )
                        : const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            )
                          )
                  )
                )
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage()
                        ),
                        (route) => false
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        )
      ),
    );
  }

  Future<bool> _signIn(BuildContext context) async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInpWithEmailAndPassword(context, email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      showSnackBar(context, "User is successfully logged in");
      Navigator.pushNamed(context, "/home");
      return true;
    } else {
      showSnackBar(context, "Some error happened");
      return false;
    }
  }
}
