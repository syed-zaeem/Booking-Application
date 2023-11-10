import 'package:flutter/material.dart';
import 'package:bookingapplication2/Screens/Add_Room_Admin.dart';

class addRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Adjust the padding as needed
      child: Stack(
        children: <Widget>[
          // Background Image
          Image.network(
            'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&q=80&w=1740&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with the path to your background image
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Text on top of the background
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[400]
                    ?.withOpacity(0.7), // Adjust opacity as needed
              ),
              child: Center(
                  child: ElevatedButton(
                onPressed: () {
                  // Perform your action when the button is pressed
                  // For example, you can navigate to the next page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddRoomAdmin()),
                  );
                },
                child: Text('Add Room'),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
