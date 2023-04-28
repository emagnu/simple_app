// Import LIBRARIES FILES PARTS PROVIDERS
//
// Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// Import FILES
import './constants/constants.dart';
import './screens/home_page.dart';
import './screens/signin_page.dart';
import './screens/signup_page.dart';
import './screens/simpleapp_page.dart';
// Import PARTS
// PROVIDERS

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://dlhflqzhrildmshtakcc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRsaGZscXpocmlsZG1zaHRha2NjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODI1ODk2MjcsImV4cCI6MTk5ODE2NTYyN30.rDGHsjPdpjMbYk3mFZ9lzE2jfkL6zl_yd_rqiYpyFLQ',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // home: const HomePage(),
      initialRoute: client.auth.currentSession != null ? '/SimpleAppPage' : '/',
      routes: {
        '/': (context) => const HomePage(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/simpleapp': (context) => const SimpleAppPage(),
      },
    );
  }
}

// // InitiLisation
// Future<void> main() async {
//   await Supabase.initialize(
//     url: 'https://xyzcompany.supabase.co',
//     anonKey: 'public-anon-key',
//   );

//   runApp(MyApp());
// }

// Get a reference your Supabase client
// final supabase = Supabase.instance.client;
