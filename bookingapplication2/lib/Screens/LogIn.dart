import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bookingapplication2/responsive/desktop_body.dart';
import 'dart:convert';

class LogIn extends StatelessWidget {
  const LogIn({super.key});
   


  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
   final String apiUrl = 'http://localhost:8000/login';


  Future<String> login() async {
    
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
       
        "username": usernameController.text,
        "password": passwordController.text,
  
      }),
    );
    if (response.statusCode == 200) {
      
    // If the status code is 200, return 'ok'
    return 'ok';
  } else {
    // If the status code is not 200, return 'Failed'
    return 'Failed';
  }
  }

    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;

    double fontSize = screenWidth < 400
        ? 15.0 // Font size for screen width less than 400
        : screenWidth < 600
            ? 16.0 // Font size for screen width less than 600
            : 18.0; // Default
    double iconSize = screenWidth < 400
        ? 20.0 // Font size for screen width less than 400
        : screenWidth < 600
            ? 24.0
            : 26.0;
    double verticalHeight = screenHeight < 400 ? 8 : 12;
    double lastlinepaddingleft = screenWidth < 600 ? 0.0 : 20.0;
    double lastlinefontsize = screenWidth < 450 ? 12 : 16;
    double buttonFont = screenWidth < 400 ? 18 : 20;
    double buttonPadding = screenWidth < 400 ? 6 : 8;
    double mainPadding = screenWidth < 400
        ? 30
        : screenWidth < 600
            ? 40
            : screenWidth < 800
                ? 100
                : screenWidth < 1000
                    ? 200
                    : 320;
    double iconPaddingLeft = screenWidth < 400
        ? 0
        : screenWidth < 600
            ? 8
            : screenWidth < 800
                ? 12
                : screenWidth < 1000
                    ? 16
                    : 20;
    double iconPaddingRight = screenWidth < 400
        ? 0
        : screenWidth < 600
            ? 8
            : screenWidth < 800
                ? 12
                : screenWidth < 1000
                    ? 16
                    : 20;

    return Scaffold(
      body: Container(
          width: double.maxFinite,
          child: Padding(
              padding: EdgeInsets.fromLTRB(mainPadding, 100, mainPadding, 0),
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                0,
                                20,
                                0,
                                10,
                              ),
                              child: TextField(
                                controller: usernameController,
                                decoration: InputDecoration(
                                  hintText: "Enter your Username",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        30), // Adjust the radius value as needed
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: verticalHeight),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        iconPaddingLeft,
                                        0,
                                        iconPaddingRight,
                                        0),
                                    child: Icon(
                                      Icons.person,
                                      size: iconSize,
                                    ),
                                  ),
                                ),
                                style: TextStyle(fontSize: fontSize),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                0,
                                0,
                                0,
                                40,
                              ),
                              child: TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Enter your Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        30), // Adjust the radius value as needed
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: verticalHeight),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        iconPaddingLeft,
                                        0,
                                        iconPaddingRight,
                                        0),
                                    child: Icon(
                                      Icons.lock,
                                      size: iconSize,
                                    ),
                                  ),
                                ),
                                style: TextStyle(fontSize: fontSize),
                              ),
                            ),
                            // Expanded(
                            Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () async{
                                    final data = await login();
                                    if (data == 'ok'){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => DesktopScaffold()));
                                    }
                                    else{
                                      //Navigator.push(context, MaterialPageRoute(builder: (context) => DesktopScaffold()));
                                    }



                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.blue)),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0, buttonPadding, 0, buttonPadding),
                                    child: Text(
                                      "Log In",
                                      style: TextStyle(
                                          fontSize: buttonFont,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  lastlinepaddingleft, 20, 0, 0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Don't have an Account ",
                                    style:
                                        TextStyle(fontSize: lastlinefontsize),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, "/Signup");
                                      },
                                      child: Text(
                                        "Sign Up Here",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: lastlinefontsize),
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
