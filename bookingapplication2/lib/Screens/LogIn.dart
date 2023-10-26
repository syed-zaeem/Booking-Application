import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;

    double fontSize = screenWidth < 400
        ? 15.0 // Font size for screen width less than 400
        : screenWidth < 600
            ? 16.0 // Font size for screen width less than 600
            : 20.0; // Default
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
                ? 80
                : screenWidth < 1000
                    ? 150
                    : 200;

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
                                decoration: InputDecoration(
                                  hintText: "Enter your Username",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        30), // Adjust the radius value as needed
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: verticalHeight),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    size: iconSize,
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
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Enter your Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        30), // Adjust the radius value as needed
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: verticalHeight),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    size: iconSize,
                                  ),
                                ),
                                style: TextStyle(fontSize: fontSize),
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
                                      onPressed: () {},
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
