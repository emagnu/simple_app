// Import LIBRARIES FILES PARTS PROVIDERS
//
// Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// Import FILES
// Import PARTS
// PROVIDERS

/// Initialise [Client] for Supabase instance
// Get a reference your Supabase client
final supabase = Supabase.instance.client;

/// Small Gap
const smallGap = SizedBox(height: 15.0);

/// Large Gap
const largeGap = SizedBox(height: 30.0);

/// Custom SnackBar
extension ShowSnackBar on BuildContext {
  void showErrorMessage(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.redAccent),
        ),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
