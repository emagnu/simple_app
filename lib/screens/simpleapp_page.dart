// Import LIBRARIES FILES PARTS PROVIDERS
//
// Import LIBRARIES
import 'package:flutter/material.dart';
// Import FILES
import '../constants/constants.dart';
// Import PARTS
// PROVIDERS

class SimpleAppPage extends StatefulWidget {
  const SimpleAppPage({Key? key}) : super(key: key);

  @override
  _SimpleAppPageState createState() => _SimpleAppPageState();
}

class _SimpleAppPageState extends State<SimpleAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  client.auth.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
                icon: const Icon(Icons.logout),
              );
            },
          ),
          title: const Text('Simple App Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /// Icon
            const Icon(
              Icons.sailing_rounded,
              size: 150,
              color: Colors.teal,
            ),
            smallGap,

            /// Text
            const Text(
              'Welcome',
              style: TextStyle(
                color: Colors.teal,
                fontSize: 50,
              ),
            ),
            smallGap,
            const Text(
              'To the Simple App experience',
              style: TextStyle(
                color: Colors.teal,
                fontSize: 25,
              ),
            ),
            largeGap,
            OutlinedButton(
              onPressed: () {
                client.auth.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              child: const Text('Sign ME out!'),
            )
          ],
        ),
      ),
    );
  }
}
