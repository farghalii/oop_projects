import 'Account.dart';

class Client {
  late int id;
  String name;
  String address;
  String phoneNumber;
  BankAccount account;
  static int nextid = 0;
  Client(
      {required this.name,
        required this.address,
        required this.phoneNumber,
        required this.account}) {
    nextid++;
    id = nextid;
  }
  void viewDetails() {
    print('name: $name');
    print('address: $address');
    print('phone number: $phoneNumber');
  }
}
