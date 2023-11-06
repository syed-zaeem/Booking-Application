import 'package:flutter/material.dart';

class Room {
  final String roomNumber;
  final String roomType;
  final int capacity;
  final double price;
  final bool isAvailable;
  final String occupancyStatus;
  final int numberOfBeds;

  Room({
    required this.roomNumber,
    required this.roomType,
    required this.capacity,
    required this.price,
    required this.isAvailable,
    required this.occupancyStatus,
    required this.numberOfBeds,
  });
}

class RoomList extends StatefulWidget {
  // const RoomList({super.key});
  final List<Room> rooms = [
    Room(
      roomNumber: '101',
      roomType: 'Single',
      capacity: 1,
      price: 100.0,
      isAvailable: true,
      occupancyStatus: 'Vacant',
      numberOfBeds: 1,
    ),
    // Add more rooms here...
  ];

  @override
  State<RoomList> createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {
  void _editRoom(Room room) {
    // Implement the logic to edit the room here.
    // You can open a form or dialog for editing the room's details.
  }

  void _deleteRoom(Room room) {
    // Implement the logic to delete the room here.
    // You can show a confirmation dialog and remove the room from the list.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Room'),
          content:
              Text('Are you sure you want to delete Room ${room.roomNumber}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  widget.rooms.remove(room);
                });
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _addRoom() {
    // Implement the logic to add a new room here.
    // You can open a form or dialog for adding a new room.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Room List')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRoom,
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Allow infinite width.
        child: DataTable(
          dataRowHeight: 60.0,
          // Adjust the height of rows as needed.
          columns: [
            DataColumn(
                label: Text(
              'Room Number',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0, // You can adjust the font size as needed
              ),
            )),
            DataColumn(
                label: Text(
              'Room Type',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0, // You can adjust the font size as needed
              ),
            )),
            DataColumn(
                label: Text(
              'Capacity',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0, // You can adjust the font size as needed
              ),
            )),
            DataColumn(
                label: Text(
              'Price',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0, // You can adjust the font size as needed
              ),
            )),
            DataColumn(
                label: Text(
              'Availability',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0, // You can adjust the font size as needed
              ),
            )),
            DataColumn(
                label: Text(
              'Occupancy Status',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0, // You can adjust the font size as needed
              ),
            )),
            DataColumn(
                label: Text(
              'Number of Beds',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0, // You can adjust the font size as needed
              ),
            )),
            DataColumn(
                label: Text(
              'Edit',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0, // You can adjust the font size as needed
              ),
            )),
            DataColumn(
                label: Text(
              'Delete',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0, // You can adjust the font size as needed
              ),
            )),
          ],
          rows: widget.rooms.map((room) {
            return DataRow(cells: [
              DataCell(Text(room.roomNumber)),
              DataCell(Text(room.roomType)),
              DataCell(Text(room.capacity.toString())),
              DataCell(Text('\$${room.price.toStringAsFixed(2)}')),
              DataCell(Text(room.isAvailable ? 'Available' : 'Not Available')),
              DataCell(Text(room.occupancyStatus)),
              DataCell(Text(room.numberOfBeds.toString())),
              DataCell(IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => _editRoom(room),
              )),
              DataCell(IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _deleteRoom(room),
              )),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
