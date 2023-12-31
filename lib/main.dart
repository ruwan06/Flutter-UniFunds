import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uni_funds/Pages/home.dart';
import 'package:uni_funds/Pages/signIn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uni_funds/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const signIn());
}

class UniFunds extends StatelessWidget {
  const UniFunds({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
