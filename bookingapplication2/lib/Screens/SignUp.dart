import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? _selectedGender;
  List<String> genderOptions = ['Male', 'Female', 'Other'];

  DateTime? _selectedDate;

  TextEditingController _dateController = TextEditingController();

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
        _dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: double.maxFinite,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(75, 50, 75, 100),
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
                              const Padding(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  20,
                                  0,
                                  10,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Enter your Full Name",
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                  // style: TextStyle(fontSize: 20),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  10,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Enter your Username",
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.account_circle),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  10,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Enter your Email",
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.email),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  10,
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
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  10,
                                ),
                                child: DropdownButtonFormField<String>(
                                  value: _selectedGender,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Select your Gender",
                                    prefixIcon: Icon(Icons.male),
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
                                  controller: _dateController,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    hintText: "Select your Date of Birth",
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.date_range),
                                  ),
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  10,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Enter your Contact",
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.phone),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  10,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Enter your Address",
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.location_on),
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
                                    hintText: "Confirm your Password",
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
                                        "Create Account",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    )),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 20, 0, 0),
                                child: Row(
                                  children: <Widget>[
                                    const Text(
                                      "Already have an Account ",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "Log In Here",
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
      ),
    );
  }
}
