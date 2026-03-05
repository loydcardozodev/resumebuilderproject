import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumerbuilder/routing/routes.dart';
import 'package:resumerbuilder/ui/util/CustomButton.dart';
import 'package:resumerbuilder/ui/util/customTextfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<bool> loginUserWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),

          child: Column(
            children: [
              SizedBox(height: 50),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Log In',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),

              Align(
                alignment: Alignment.topLeft,
                child: Text('Please enter log in details below'),
              ),

              SizedBox(height: 40),

              const SizedBox(height: 10),

              _buildLabel("Email"),
              _buildTextField("Enter address", controller: emailController),

              SizedBox(height: 20),

              _buildLabel("Password"),
              _buildTextField("Enter address", controller: passwordController),

              SizedBox(height: 20),
              SizedBox(height: 20),

              GestureDetector(
                onTap: () async {
                  bool success = await loginUserWithEmailAndPassword();

                  if (success) {
                    context.go(Routes.home);
                  }
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have an account.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(Routes.signup);
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildTextField(
    String hint, {
    int maxLines = 1,
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(hintText: hint),
    );
  }
}
