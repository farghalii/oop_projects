import 'patient.dart';
import 'dart:io';

class Doctor {
  int id;
  String name;
  String specialization;
  List<Patient> patients = [];

  Doctor({required this.id, required this.name, required this.specialization});

  void assignPatient(Patient patient) {
    patients.add(patient);
  }

  void viewPatients() {
    for (Patient patient in patients) {
      print(patient);
    }
  }

  void displayInfo() {
    print('doctor id: $id');
    print('doctor name: $name');
    print('doctor specialization: $specialization');
    stdout.write('doctor patients: ');
    if (patients.isEmpty) {
      print('doctor has no patients');
    } else {
      viewPatients();
    }
  }
}
