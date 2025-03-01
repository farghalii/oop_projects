import 'package:untitled/hotel_system/guest.dart';

class Bill {
  Guest guest;
  double total_amount;
  Bill({required this.guest, this.total_amount = 0});
  void addCharge(double amount) {
    if (amount > 0) {
      total_amount += amount;
    } else {
      print('enter a positive number');
    }
  }
  void displayBill()
  {
    print(' guest ${guest.name} bill is ${total_amount.toStringAsFixed(2)}');
  }
}
