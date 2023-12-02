import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:uni_funds/Components/background.dart';

class signIn extends StatelessWidget {
  const signIn({super.key});
  Future<void> signInWithGoogle() async {
    GoogleSignInAccount? googleUser;

    try {
      // googleUser = await GoogleSignIn().signOut();
      googleUser = await GoogleSignIn().signIn();

      if (googleUser != null && googleUser.email != null) {
        // Check if the user's email has the required domain
        if (googleUser.email!.endsWith('@stu.cmb.ac.lk') ||
            googleUser.email!.endsWith('@iat.cmb.ac.lk') ||
            googleUser.email!.endsWith('@ict.cmb.ac.lk') ||
            googleUser.email!.endsWith('@at.cmb.ac.lk') ||
            googleUser.email!.endsWith('@et.cmb.ac.lk')) {
          final GoogleSignInAuthentication googleAuth =
              await googleUser.authentication;

          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );

          await FirebaseAuth.instance.signInWithCredential(credential);

          print("User -> $googleUser");
          // User is signed in
        } else {
          // User has an invalid email domain
          googleUser = await GoogleSignIn().signOut();

          print("Invalid email domain. Only cmb.ac.lk emails are allowed.");
        }
      } else {
        // Google sign-in was canceled or failed
        print("Google sign-in failed or canceled => $googleUser");
      }
    } catch (error) {
      // Handle sign-in errors
      print("Sign-In error: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Background(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome to ",
                        style: GoogleFonts.roboto(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "UniFunds",
                        style: GoogleFonts.rocknRollOne(
                            color: const Color(0xFFF70A0A),
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 250.0,
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    "Your university email is your ticket to UniFunds. We prioritize the security of our community by ensuring that only verified students have access to the app.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rocknRollOne(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    'assets/sign_up_icon.svg',
                    height: 300,
                    width: 300,
                  ),
                ),
                const SizedBox(height: 30),
                SignInButton(
                  Buttons.google,
                  onPressed: () {
                    signInWithGoogle();
                  },
                  elevation: 20.0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(
                        5.0)), // Adjust the border radius as needed
                  ),
                ),
                const SizedBox(height: 130),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
