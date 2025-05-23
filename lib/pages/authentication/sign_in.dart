import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:project_1/Admin/admin_login.dart';
import 'package:project_1/pages/authentication/auth.dart';
import 'package:project_1/pages/authentication/sign_up.dart';
import 'package:project_1/pages/navigation_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? mail, password;

  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail!, password: password!);
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NavigationScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "No User Found for that Email",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Wrong Paasword",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
                Color.fromARGB(255, 187, 33, 218),
                Color.fromARGB(255, 89, 29, 98),
                Color(0xFF311937),
              ])),
              child: const Text(
                "Hello\nSign In!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 40.0, left: 30.0, right: 30.0, bottom: 35.0),
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 23.0,
                          fontWeight: FontWeight.w500),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please Enter Email';
                        }
                        return null;
                      },
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail_outlined),
                        hintText: "Email",
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 23.0,
                          fontWeight: FontWeight.w500),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please Enter Password';
                        }
                        return null;
                      },
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.password_outlined),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forget Password ?",
                          style: TextStyle(
                              color: Color.fromARGB(255, 71, 71, 71),
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            mail = emailcontroller.text;
                            password = passwordcontroller.text;
                          });
                          userLogin();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 187, 33, 218),
                              Color.fromARGB(255, 89, 29, 98),
                              Color(0xFF311937),
                            ]),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: const Center(
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold),
                          ),
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
                          AuthMethods().signInWithGoogle(context);
                        },
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Don't have an Account",
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
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color.fromARGB(255, 185, 22, 171),
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminLogin()));
                        },
                        child: Text(
                          "Sign In as ADMIN",
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
