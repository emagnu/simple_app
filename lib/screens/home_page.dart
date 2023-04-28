// Import LIBRARIES FILES PARTS PROVIDERS
//
// Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:simple_app/constants/constants.dart';
// Import FILES
// Import PARTS
// PROVIDERS

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.sailing_rounded,
              size: 150,
              color: Colors.teal,
            ),

            // Text
            const Text(
              'Simple app',
              style: TextStyle(
                fontSize: 50,
                color: Colors.teal,
              ),
            ),
            largeGap,

            /// Sing In Button
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signin');
              },
              child: const Text('Sing In'),
            ),
            smallGap,

            /// Sign Up Button
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text('Sing Up'),
            ),
          ],
        ),
      ),
    );
  }
}
