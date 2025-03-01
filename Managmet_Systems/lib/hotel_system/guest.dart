class Guest {
  final int id;
  String name;
  String phone_number;
  Guest({required this.id, required this.name, required this.phone_number});
  void displayInfo() {
    print('guest id is:  $id');
    print('guest name is:  $name');
    print('guest phone number is:  $phone_number');
  }
}
