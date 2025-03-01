class Room {
  int room_number;
  String type;
  double price;
  bool isAvailable;
  Room({required this.room_number, required this.type, required this.price})
      : isAvailable = true;
  void displayInfo() {
    print('room number is:  $room_number');
    print('room type is:  $type');
    print('room price is:  $price');
    if (isAvailable) {
      print('the room is available');
    } else {
      print('the room is not available');
    }
  }
}
