import 'booking.dart';
import 'guest.dart';
import 'room.dart';
import 'bill.dart';
import 'dart:io';

class Hotel {
  List<Guest> guests = [];
  List<Room> rooms = [];
  List<Booking> bookings = [];
  List<Bill> bills = [];

  void start() {
    while (true) {
      print("Hotel Management System");
      print("enter 1 Add Guest");
      print("enter 2 Add Room");
      print("enter 3 Book Room");
      print("enter 4 View Guests");
      print("enter 5 View Rooms");
      print("enter 6 View Bookings");
      print("enter 7 Generate Bill");
      print("enter 8 View Bill");
      print("enter 0  Exit");
      stdout.write("Choose an option: ");
      int choice = int.parse(stdin.readLineSync() ?? '0');
      switch (choice) {
        case 1:
          addGuest();
          break;
        case 2:
          addRoom();
          break;
        case 3:
          bookRoom();
          break;
        case 4:
          viewGuest();
          break;
        case 5:
          viewRoom();
          break;
        case 6:
          viewBooking();
          break;
        case 7:
          generateBill();
          break;
        case 8:
          viewBill();
          break;
        case 0:
          print('goodbye');
          return;
        default:
          print('please enter a number between 0 and 8');
      }
    }
  }
  void run()
  {

  }

  void addGuest() {
    try {
      print('enter guest id');
      int guest_id = int.parse(stdin.readLineSync()!);
      print('enter guest name');
      String name = stdin.readLineSync()!;
      print('enter guest phone number');
      String phone = stdin.readLineSync()!;
      guests.add(Guest(id: guest_id, name: name, phone_number: phone));
      print('guest added successfully');
    } catch (e) {
      print('you must enter all of these attributes');
    }
  }

  void viewGuest() {
    if (guests.isEmpty) {
      print('no guests available');
      return;
    }
    for (Guest guest in guests) {
      guest.displayInfo();
    }
  }

  void addRoom() {
    try {
      print('enter room number ');
      int number = int.parse(stdin.readLineSync()!);
      print('enter room type (single,double suite)');
      String type = stdin.readLineSync()!;
      print('enter room price per night');
      double price = double.parse(stdin.readLineSync()!);
      rooms.add(Room(room_number: number, type: type, price: price));
      print('room added successfully');
    } catch (e) {
      print('you must enter all of these attributes');
    }
  }

  void bookRoom() {
    if (guests.isEmpty || rooms.isEmpty) {
      print('no guests or rooms available');
      return;
    }
    print('select a guest');
    for (Guest guest in guests) {
      print('${guest.id}---${guest.name}');
    }

    print('enter guest id');
    int? guest_id = int.parse(stdin.readLineSync()!);
    Guest? selected_guest;
    try {
      selected_guest = guests.firstWhere((g) => g.id == guest_id);
    } catch (e) {
      selected_guest = null;
    }
    if (selected_guest == null) {
      print('invalid guest ID');
      return;
    }

    print('select a room');
    for (Room room in rooms) {
      print('${room.room_number}---${room.type}');
    }

    print('enter room number');
    int? roomNumber = int.parse(stdin.readLineSync()!);
    Room? selected_room;
    try {
      selected_room = rooms.firstWhere((r) => r.room_number == roomNumber);
    } catch (e) {
      selected_room = null;
    }
    if (selected_room == null) {
      print('invalid room number');
      return;
    }
    stdout.write("Enter Check-in Date (YYYY-MM-DD): ");
    String dateTimeStrin = stdin.readLineSync()!;
    DateTime checkIn = DateTime.parse(dateTimeStrin);
    stdout.write("Enter Check-out Date (YYYY-MM-DD) : ");
    String dateTimeStrout = stdin.readLineSync()!;
    DateTime checkOut = DateTime.parse(dateTimeStrout);

    bookings.add(Booking(
        guest: selected_guest,
        room: selected_room,
        check_in: checkIn,
        check_out: checkOut));
    print(" Room booked successfully!");
  }

  void viewRoom() {
    if (rooms.isEmpty) {
      print('there is no rooms');
      return;
    }
    for (Room room in rooms) {
      room.displayInfo();
    }
  }

  void viewBooking() {
    if (bookings.isEmpty) {
      print('there is no bookings');
      return;
    }
    for (Booking booking in bookings) {
      booking.displayInfo();
    }
  }

  void generateBill() {
    if (guests.isEmpty) {
      print('there is no guests');
      return;
    }
    print('select a guest');
    for (Guest guest in guests) {
      print('${guest.id}---${guest.name}');
    }

    print('enter guest id');
    int? guest_id = int.parse(stdin.readLineSync()!);
    Guest? selected_guest;
    try {
      selected_guest = guests.firstWhere((g) => g.id == guest_id);
    } catch (e) {
      selected_guest = null;
    }
    if (selected_guest == null) {
      print('invalid guest ID');
      return;
    }
    Bill bill = Bill(guest: selected_guest);
    print('Enter amount to add to the bill:');
    double amount = double.parse(stdin.readLineSync()!);
    bill.addCharge(amount);
    bills.add(bill);
    print('bill generated successfully');
  }

  void viewBill() {
    if (bills.isEmpty) {
      print('there are no bills');
      return;
    }
    for (Bill bill in bills) {
      bill.displayBill();
    }
  }
}

void main() {
  Hotel run = Hotel();
  run.start();
}
