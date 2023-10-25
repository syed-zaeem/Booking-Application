import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.maxFinite,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(75, 100, 75, 0),
              child: Column(
                children: <Widget>[
                  const Text(
                    "MOBILE",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 33, 37, 243)),
                  ),
                  Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Column(
                          children: <Widget>[
                            const Text(
                              "Log In to your Account",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                20,
                                0,
                                10,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Enter your Username",
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.person),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                0,
                                0,
                                40,
                              ),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Enter your Password",
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.lock),
                                ),
                              ),
                            ),
                            // Expanded(
                            Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.blue)),
                                  child: const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                                    child: Text(
                                      "Log In",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Row(
                                children: <Widget>[
                                  const Text(
                                    "Don't have an Account ",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Sign Up Here",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ))
                                ],
                              ),
                            )
                            // )
                          ],
                        ),
                      ))
                ],
              ))),
    );
  }
}
