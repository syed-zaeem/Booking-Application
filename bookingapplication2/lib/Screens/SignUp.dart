import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? _selectedGender;
  String? _selectedRole;
  List<String> genderOptions = ['Male', 'Female', 'Other'];
  List<String> roleOptions = ['Seller', 'Customer'];

  DateTime? _selectedDate;

  TextEditingController dateController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final String apiUrl = 'http://localhost:8000/signup';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> addItem() async {
    print("Hello Ammar!");
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "name": nameController.text,
        "dateOfBirth": dateController.text,
        "gender": _selectedGender,
        "role": _selectedRole,
        "username": usernameController.text,
        "password": passwordController.text,
        "email": emailController.text,
        "contact": contactController.text,
        "address": addressController.text,
      }),
    );
    if (response.statusCode != '1') {
      AlertDialog(
          title: Text('Delete Room'),
          content:
              Text('Are you sure you want to delete Room?'),
          
        );
      // nameController.clear();
      // dateController.clear();
      // genderController.clear();
      // roleController.clear();
      // usernameController.clear();
      // passwordController.clear();
      // emailController.clear();
      // contactController.clear();
      // addressController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

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
      body: SingleChildScrollView(
        child: Container(
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
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Column(
                            children: <Widget>[
                              const Text(
                                "Create New Account",
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
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    hintText: "Enter your Full Name",
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
                                      child: Icon(Icons.account_circle,
                                          size: iconSize),
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
                                  10,
                                ),
                                child: TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: "Enter your Email",
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
                                        Icons.email,
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
                                  10,
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
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  10,
                                ),
                                child: TextField(
                          
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Confirm your Password",
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
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  10,
                                ),
                                child: DropdownButtonFormField<String>(
                                  
                                  value: _selectedGender,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          30), // Adjust the radius value as needed
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: verticalHeight),
                                    hintText: "Select your Gender",
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          iconPaddingLeft,
                                          0,
                                          iconPaddingRight,
                                          0),
                                      child: Icon(
                                        Icons.male,
                                        size: iconSize,
                                      ),
                                    ),
                                  ),
                                  items: genderOptions.map((String gender) {
                                    return DropdownMenuItem<String>(
                                      value: gender,
                                      child: Text(gender),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedGender = newValue;
                                    });
                                  },
                                  style: TextStyle(fontSize: fontSize),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  10,
                                ),
                                child: TextFormField(
                                  controller: dateController,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: "Select your Date of Birth",
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
                                        Icons.date_range,
                                        size: iconSize,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                  style: TextStyle(fontSize: fontSize),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  10,
                                ),
                                child: TextField(
                                  controller: contactController,
                                  decoration: InputDecoration(
                                    hintText: "Enter your Contact",
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
                                        Icons.phone,
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
                                  10,
                                ),
                                child: TextField(
                                  controller: addressController,
                                  decoration: InputDecoration(
                                    hintText: "Enter your Address",
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
                                        Icons.location_on,
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
                                child: DropdownButtonFormField<String>(
                                  value: _selectedRole,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          30), // Adjust the radius value as needed
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: verticalHeight),
                                    hintText: "Select your Role",
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
                                  items: roleOptions.map((String role) {
                                    return DropdownMenuItem<String>(
                                      value: role,
                                      child: Text(role),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedRole = newValue;
                                    });
                                  },
                                  style: TextStyle(fontSize: fontSize),
                                ),
                              ),

                              // Expanded(
                              Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      AlertDialog(
                                          title: Text('Sing up '),
                                          content: Text('Sucess'));
                                      await addItem();
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blue)),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0, buttonPadding, 0, buttonPadding),
                                      child: Text(
                                        "Create Account",
                                        style: TextStyle(
                                            fontSize: buttonFont,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    lastlinepaddingleft, 20, 0, 300),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Already have an Account ",
                                      style:
                                          TextStyle(fontSize: lastlinefontsize),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, "/Login");
                                        },
                                        child: Text(
                                          "Log In Here",
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
      ),
    );
  }
}
