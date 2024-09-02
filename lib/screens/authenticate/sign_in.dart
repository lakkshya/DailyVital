import 'package:daily_vital/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding:
              const EdgeInsets.symmetric(vertical: 200.0, horizontal: 30.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 87, 228),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Please login to continue your journey of tracking meds',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        var result = await _auth.signInAnon();
                        if (result == null) {
                          print('error signing in');
                        } else {
                          print('signed in');
                          print(result.uid);
                        }
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Handle navigation to sign-up page
                  },
                  child: const Text('Don\'t have an account? Sign Up'),
                ),
              ],
            ),
          )),
    );
  }
}
