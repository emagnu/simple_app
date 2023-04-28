// Import LIBRARIES FILES PARTS PROVIDERS
//
// Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// Import FILES
import '../constants/constants.dart';
// Import PARTS
// PROVIDERS

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  /// Initialise Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// [createUser] function that handels user creation
  Future<User?> createUser({
    required final String email,
    required final String password,
  }) async {
    // final response = await client.auth.signup(
    //   email: email,
    //   password: password,
    // );
    // final user = response.data?.user;
    // return user?.id;

    /// My attempt to use supabase newest version
    final AuthResponse response = await client.auth.signUp(
      email: email,
      password: password,
    );
    final Session? session = response.session;
    final User? user = response.user;
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Icon
            const Icon(
              Icons.sailing_rounded,
              size: 150,
              color: Colors.teal,
            ),
            largeGap,

            /// Email Text Imput
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(label: Text('Email')),
              ),
            ),
            smallGap,

            /// Password Text Imput
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(label: Text('Password')),
                obscureText: true,
              ),
            ),
            largeGap,

            /// Sigup Button

            OutlinedButton(
              onPressed: () {},
              // () async {
              //   final userValue = await createUser(email: _emailController.text, password: _passwordController.text); if
              // },
              child: const Text('Sign Me In'),
            ),
          ],
        ),
      ),
    );
  }
}
