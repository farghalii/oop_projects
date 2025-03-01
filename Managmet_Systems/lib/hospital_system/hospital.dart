import 'appointment.dart';
import 'bill.dart';
import 'doctor.dart';
import 'patient.dart';
import 'dart:io';

class Hospital {
  List<Patient> patients = [];
  List<Doctor> doctors = [];
  List<Appointment> appointments = [];
  List<Bill> bills = [];

  void start() {
    while (true) {
      print("Hospital Management System");
      print("enter 1 to Add Patient ");
      print("enter 2 to Add Doctor ");
      print("enter 3 to Schedule Appointment ");
      print("enter 4 to Generate Bill ");
      print("enter 5 to View All Patients ");
      print("enter 6 to View All Doctors ");
      print("enter 7 to View All Appointments ");
      print("enter 8 to View Bills ");
      print("enter 0 to Exit ");
      stdout.write("Choose an option: ");
      int choice = int.parse(stdin.readLineSync() ?? '0');
      switch (choice) {
        case 1:
          addPatient();
          break;
        case 2:
          addDoctor();
          break;
        case 3:
          scheduleAppointment();
          break;
        case 4:
          generateBill();
          break;
        case 5:
          viewPatients();
          break;
        case 6:
          viewDoctors();
          break;
        case 7:
          viewAppointments();
          break;
        case 8:
          viewBill();
          break;
        case 0:
          print("happy to deal with you, Goodbye!");
          return;
        default:
          print("enter a number between 1 and 8. to exit enter 0");
      }
    }
  }

  void addPatient() {
    stdout.write('enter the patient id:   ');
    int id = int.parse(stdin.readLineSync()!);
    stdout.write('enter the patient name:   ');
    String name = stdin.readLineSync()!;
    stdout.write('enter the patient age:   ');
    int age = int.parse(stdin.readLineSync() ?? '18');
    stdout.write('enter the patient phone number :   ');
    String phone = stdin.readLineSync()!;
    patients.add(Patient(id: id, name: name, age: age, phone_number: phone));
    print('patient added Successfully');
  }

  void addDoctor() {
    stdout.write('enter the doctor id:   ');
    int id = int.parse(stdin.readLineSync()!);
    stdout.write('enter the doctor name:   ');
    String name = stdin.readLineSync()!;
    stdout.write('enter the doctor specialization :   ');
    String specialization = stdin.readLineSync()!;
    doctors.add(Doctor(id: id, name: name, specialization: specialization));
    print('doctor added Successfully');
  }

  void viewPatients() {
    if (patients.isEmpty) {
      print('there is no patients');
      return;
    }
    for (Patient patient in patients) {
      patient.displayInfo();
    }
  }

  void viewDoctors() {
    if (doctors.isEmpty) {
      print('there is no doctors');
      return;
    }
    for (Doctor doctor in doctors) {
      doctor.displayInfo();
    }
  }

  void scheduleAppointment() {
    if (patients.isEmpty || doctors.isEmpty) {
      print(
          'you need at least one doctor and one patient to schedule ann appointment');
    } else {
      print('Available patients are ');
      for (Patient patient in patients) {
        print('${patient.id} -- ${patient.name}');
      }
      print('enter patient id ');
      int patient_id = int.parse(stdin.readLineSync()!);
      Patient? selectedpatient;
      try {
        selectedpatient = patients.firstWhere((p) => p.id == patient_id);
      } catch (e) {
        selectedpatient = null;
      }

      if (selectedpatient == null) {
        print("Invalid Patient ID!");
        return;
      }

      print('Available doctors are ');
      for (Doctor doctor in doctors) {
        print('${doctor.id} -- ${doctor.name}');
      }
      print('enter doctor id ');
      int doctor_id = int.parse(stdin.readLineSync()!);
      Doctor? selecteddoctor;
      try {
        selecteddoctor = doctors.firstWhere((d) => d.id == doctor_id);
      } catch (e) {
        selecteddoctor = null;
      }

      if (selecteddoctor == null) {
        print("Invalid doctor ID!");
        return;
      }

      print('enter date time (yyyy-mm-dd)');
      String dateTimeStr = stdin.readLineSync()!;
      DateTime dateTime = DateTime.parse(dateTimeStr);
      appointments.add(Appointment(
          patient: selectedpatient,
          doctor: selecteddoctor,
          dateTime: dateTime));
      selecteddoctor.assignPatient(selectedpatient);
      print(" Appointment Scheduled Successfully");
    }
  }

  void viewAppointments() {
    if (appointments.isEmpty) {
      print("No appointments scheduled.");
      return;
    }
    for (Appointment appointment in appointments) {
      appointment.displayInfo();
    }
  }

  void generateBill() {
    print('Available patients are ');
    for (Patient patient in patients) {
      print('${patient.id} -- ${patient.name}');
    }
    print('enter patient id ');
    int patient_id = int.parse(stdin.readLineSync()!);
    Patient? selectedpatient;
    try {
      selectedpatient = patients.firstWhere((p) => p.id == patient_id);
    } catch (e) {
      selectedpatient = null;
    }

    if (selectedpatient == null) {
      print("Invalid Patient ID!");
      return;
    }
    Bill bill = Bill(patient: selectedpatient);
    while (true) {
      print('enter Charge description (if u want to finish enter (break))');
      String description = stdin.readLineSync()!;
      if (description.toLowerCase() == 'break') break;
      print('enter Charge amount');
      double amount = double.parse(stdin.readLineSync()!);
      bill.addCharge(description, amount);
      print("Charge Added");
    }
    bills.add(bill);
    print('bill generated Successfully');
  }

  void viewBill() {
    for (Bill bill in bills) {
      bill.displayBill();
    }
  }
}

void main() {
  Hospital hospital = Hospital();
  hospital.start();
}
