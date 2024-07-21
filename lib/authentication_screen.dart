import 'package:flutter/material.dart';
import 'login.dart';
import 'sign_up.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-screen background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/Solano-bg.png'), // Update with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Welcome Text
                Text(
                  'Welcome',
                  style: GoogleFonts.poppins(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 202, 178, 68),
                  ),
                ),
                const SizedBox(height: 20),
                // Login Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginForm(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 8, 102, 31),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(
                          255, 255, 255, 255), // Set text color to white
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Register Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupForm(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Text(
                    "Don't have an account? Register",
                    style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 202, 184, 81),
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
