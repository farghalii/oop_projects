import 'patient.dart';

class Bill {
  Patient patient;
  Map<String, double> charges = {};
  Bill({required this.patient});

  void addCharge(String description, double amount) {
    charges[description] = amount;
    patient.addCharge(amount);
  }

  void displayBill() {
    print(" Bill for ${patient.name}:");
    charges.forEach((desc, amount) {
      print("$desc: ${amount}");
    });
    print(" Total Bill: ${patient.totalbill}");
  }
}
