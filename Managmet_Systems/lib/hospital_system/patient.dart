import 'dart:io';

class Patient {
  int id;
  String name;
  String phone_number;
  int age;
  List<String> medical_history = [];
  double totalbill = 0;
  Patient(
      {required this.id,
        required this.name,
        required this.age,
        required this.phone_number});
  void displayInfo() {
    print('patient id: $id');
    print('patient name: $name');
    print('patient age: $age');
    print('patient phone number: $phone_number');
    stdout.write('patient medical history: ');
    if (medical_history.isEmpty) {
      print('patient has no medical history ');
    } else {
      showMedicalRecords();
    }
  }

  void addMedicalrecord(String record) {
    medical_history.add(record);
  }

  void showMedicalRecords() {
    for (var record  in medical_history) {
      print(record );
    }
  }

  double addCharge(double amount) {
    if (amount < 0) {
      print('invalid input please try with postive number');
      return 0;
    }
    totalbill += amount;
    return totalbill;
  }
}
