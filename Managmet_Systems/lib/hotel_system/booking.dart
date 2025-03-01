import 'dart:io';

import 'package:untitled/hotel_system/room.dart';

import 'guest.dart';

class Booking {
  Guest guest;
  Room room;
  DateTime check_in;
  DateTime? check_out;
  Booking(
      {required this.guest,
      required this.room,
      required this.check_in,
        required this.check_out}){
    room.isAvailable=false;
  }
  void displayInfo() {
    stdout.writeln(
        'guest ${guest.name} booked room ${room.room_number} at time $check_in and left at time $check_out ');
  }
}
