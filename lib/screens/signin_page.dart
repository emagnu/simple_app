// Import LIBRARIES FILES PARTS PROVIDERS
//
// Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// Import FILES
import '../constants/constants.dart';
// Import PARTS
// PROVIDERS

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  /// [userLogin] function that hadles the login
  Future<String?> userLogin({
    required final String email,
    required final String password,
  }) async {
    // final response = await client.auth.signIn(
    //   email: email,
    //   password: password,
    // );
    // final user = response.data?.user;
    // return user?.id;
    /// My attempt to use supabase newest version
    final AuthResponse res = await client.auth.signInWithPassword(
      email: 'example@email.com',
      password: 'example-password',
    );
    final Session? session = res.session;
    final User? user = res.user;
    return user?.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In Page'),
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

            /// Sign in Button
            isLoading
                ? Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : OutlinedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      dynamic loginValue = await userLogin(
                          email: _emailController.text,
                          password: _passwordController.text);
                      setState(() {
                        isLoading = false;
                      });
                      if (loginValue != null) {
                        Navigator.pushReplacementNamed(
                          context,
                          '/simpleapp',
                        );
                      } else {
                        context.showErrorMessage('Invalid Email or Password!');
                      }
                    },
                    child: const Text('Sign Me In'),
                  ),
          ],
        ),
      ),
    );
  }
}
