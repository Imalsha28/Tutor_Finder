import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:project_1/pages/authentication/sign_in.dart';
import 'package:project_1/pages/navigation_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? name, mail, password;

  TextEditingController namecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (password != null && name != null && mail != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: mail!, password: password!);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Registered Successfully",
          style: TextStyle(fontSize: 20.0),
        )));
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NavigationScreen()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "Provided Password is too weak",
            style: TextStyle(fontSize: 20.0),
          )));
        } else if (e.code == "Email-already-in-use") {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "Account Alrady Exists",
            style: TextStyle(fontSize: 20.0),
          )));
        }
      }
    }
  }

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
            child: Form(
              key: _formkey,
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
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please Enter Name';
                      }
                      return null;
                    },
                    controller: namecontroller,
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
                    height: 30.0,
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
                    height: 40.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          mail = emailcontroller.text;
                          name = namecontroller.text;
                          password = passwordcontroller.text;
                        });
                      }
                      registration();
                    },
                    child: Container(
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
            ),
          )
        ],
      ),
    );
  }
}
