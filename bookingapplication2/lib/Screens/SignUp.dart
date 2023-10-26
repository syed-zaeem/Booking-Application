import 'package:flutter/material.dart';

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
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  20,
                                  0,
                                  10,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Enter your Full Name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          30), // Adjust the radius value as needed
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      size: 24,
                                    ),
                                  ),
                                  style: const TextStyle(fontSize: 16),
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
                                  decoration: InputDecoration(
                                    hintText: "Enter your Username",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          30), // Adjust the radius value as needed
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    prefixIcon: const Icon(Icons.account_circle,
                                        size: 24),
                                  ),
                                  style: const TextStyle(fontSize: 16),
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
                                  decoration: InputDecoration(
                                    hintText: "Enter your Email",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          30), // Adjust the radius value as needed
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      size: 24,
                                    ),
                                  ),
                                  style: const TextStyle(fontSize: 16),
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
                                    hintText: "Enter your Password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          30), // Adjust the radius value as needed
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      size: 24,
                                    ),
                                  ),
                                  style: const TextStyle(fontSize: 16),
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
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      size: 24,
                                    ),
                                  ),
                                  style: const TextStyle(fontSize: 16),
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
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    hintText: "Select your Gender",
                                    prefixIcon: const Icon(
                                      Icons.male,
                                      size: 24,
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
                                  style: const TextStyle(fontSize: 16),
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
                                  decoration: InputDecoration(
                                    hintText: "Select your Date of Birth",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          30), // Adjust the radius value as needed
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    prefixIcon: const Icon(
                                      Icons.date_range,
                                      size: 24,
                                    ),
                                  ),
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                  style: const TextStyle(fontSize: 16),
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
                                  decoration: InputDecoration(
                                    hintText: "Enter your Contact",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          30), // Adjust the radius value as needed
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    prefixIcon: const Icon(
                                      Icons.phone,
                                      size: 24,
                                    ),
                                  ),
                                  style: const TextStyle(fontSize: 16),
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
                                  decoration: InputDecoration(
                                    hintText: "Enter your Address",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          30), // Adjust the radius value as needed
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    prefixIcon: const Icon(
                                      Icons.location_on,
                                      size: 24,
                                    ),
                                  ),
                                  style: const TextStyle(fontSize: 16),
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
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    hintText: "Select your Role",
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      size: 24,
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
                                  style: const TextStyle(fontSize: 16),
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
