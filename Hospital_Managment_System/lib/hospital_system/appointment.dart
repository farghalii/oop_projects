import 'doctor.dart';
import 'patient.dart';

class Appointment {
  Patient patient;
  Doctor doctor;
  DateTime dateTime;
  Appointment(
      {required this.patient, required this.doctor, required this.dateTime});

  void displayInfo() {
    String formattedDate = dateTime.toLocal().toString().split('.')[0];
    print(
        'patient ${patient.name} has an appointment at $formattedDate with doctor ${doctor.name}');
  }

}
