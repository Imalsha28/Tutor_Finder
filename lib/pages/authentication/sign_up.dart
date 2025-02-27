import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:project_1/pages/authentication/sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 60.0,
              left: 30.0,
            ),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 185, 22, 171),
              Color.fromARGB(255, 98, 29, 81),
              Color(0xFF311937),
            ])),
            child: const Text(
              "Create Your\nAccount",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                top: 30.0, left: 30.0, right: 30.0, bottom: 35.0),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 23.0,
                      fontWeight: FontWeight.w500),
                ),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outlined),
                    hintText: "Name",
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 23.0,
                      fontWeight: FontWeight.w500),
                ),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail_outlined),
                    hintText: "Email",
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 23.0,
                      fontWeight: FontWeight.w500),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.password_outlined),
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 185, 22, 171),
                        Color.fromARGB(255, 98, 29, 81),
                        Color(0xFF311937),
                      ]),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: const Center(
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: SignInButton(
                    Buttons.Google,
                    text: "Continue with Google",
                    onPressed: () {
                      // Add your Google sign-in logic here
                    },
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Already have an Account?",
                      style: TextStyle(
                          color: Color.fromARGB(255, 29, 29, 29),
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Sign In",
                        style: TextStyle(
                            color: Color.fromARGB(255, 185, 22, 171),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
