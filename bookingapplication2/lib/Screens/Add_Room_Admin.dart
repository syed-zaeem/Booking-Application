import 'package:flutter/material.dart';

class AddRoomAdmin extends StatefulWidget {
  const AddRoomAdmin({super.key});

  @override
  State<AddRoomAdmin> createState() => _AddRoomAdminState();
}

class _AddRoomAdminState extends State<AddRoomAdmin> {
  String? _selectedGender;
  String? _selectedRole;
  String? _selectedRoomtype;
  String? _selectedOccupancyStatus;
  List<String> genderOptions = ['Male', 'Female', 'Other'];
  List<String> roleOptions = ['Seller', 'Customer'];
  List<String> roomtypeOptions = [
    'Single',
    'Double',
    'Suite',
    'Deluxe',
    'Family'
  ];
  List<String> occupancystatusOptions = [
    'Vacant',
    'Occupied',
    'Reserved',
    'Cleaning in Progress'
  ];

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
                padding: EdgeInsets.fromLTRB(mainPadding, 50, mainPadding, 0),
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
                                "Add New Room",
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
                                    hintText: "Enter the Room Number",
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
                                        Icons.confirmation_number,
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
                                  value: _selectedRoomtype,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          30), // Adjust the radius value as needed
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: verticalHeight),
                                    hintText: "Select the Room Type",
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          iconPaddingLeft,
                                          0,
                                          iconPaddingRight,
                                          0),
                                      child: Icon(
                                        Icons.local_hotel,
                                        size: iconSize,
                                      ),
                                    ),
                                  ),
                                  items: roomtypeOptions.map((String roomtype) {
                                    return DropdownMenuItem<String>(
                                      value: roomtype,
                                      child: Text(roomtype),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedRoomtype = newValue;
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
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Enter the Capacity of people",
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
                                      child: Icon(Icons.group, size: iconSize),
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
                                  decoration: InputDecoration(
                                    hintText: "Enter the Price per night",
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
                                        Icons.attach_money,
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
                                  value: _selectedOccupancyStatus,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          30), // Adjust the radius value as needed
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: verticalHeight),
                                    hintText: "Select the Occupancy Status",
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          iconPaddingLeft,
                                          0,
                                          iconPaddingRight,
                                          0),
                                      child: Icon(
                                        Icons.local_mall,
                                        size: iconSize,
                                      ),
                                    ),
                                  ),
                                  items: occupancystatusOptions
                                      .map((String occupancystatus) {
                                    return DropdownMenuItem<String>(
                                      value: occupancystatus,
                                      child: Text(occupancystatus),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedOccupancyStatus = newValue;
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
                                  40,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Enter the Number of Beds",
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
                                        Icons.single_bed,
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
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blue)),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0, buttonPadding, 0, buttonPadding),
                                      child: Text(
                                        "Add Room",
                                        style: TextStyle(
                                            fontSize: buttonFont,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    )),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.fromLTRB(
                              //       lastlinepaddingleft, 20, 0, 300),
                              //   child: Row(
                              //     children: <Widget>[
                              //       Text(
                              //         "Already have an Account ",
                              //         style:
                              //             TextStyle(fontSize: lastlinefontsize),
                              //       ),
                              //       TextButton(
                              //           onPressed: () {
                              //             Navigator.pushNamed(
                              //                 context, "/Login");
                              //           },
                              //           child: Text(
                              //             "Log In Here",
                              //             style: TextStyle(
                              //                 fontWeight: FontWeight.bold,
                              //                 fontSize: lastlinefontsize),
                              //           ))
                              //     ],
                              //   ),
                              // )
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
