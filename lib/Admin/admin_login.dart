import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_1/Admin/home_admin.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController usernamecontroller = new TextEditingController();
  TextEditingController userpasswordcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 75.0,
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
                "Admin Panel",
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
                      "User Name",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 23.0,
                          fontWeight: FontWeight.w500),
                    ),
                    TextFormField(
                      controller: usernamecontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outlined),
                        hintText: "User Name",
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
                      controller: userpasswordcontroller,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.password_outlined),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 70.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        loginAdmin();
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
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }

  loginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()['username'] != usernamecontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "Your ID is not correct",
            style: TextStyle(fontSize: 20.0),
          )));
        } else if (result.data()['password'] !=
            userpasswordcontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "Your Password is not correct",
            style: TextStyle(fontSize: 20.0),
          )));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Dashboard()));
        }
      });
    });
  }
}
