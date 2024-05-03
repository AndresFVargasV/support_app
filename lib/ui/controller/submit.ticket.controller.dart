import 'package:flutter/material.dart';

class SupportTicketController with ChangeNotifier {
  TextEditingController descriptionController = TextEditingController();
  String? selectedHour;
  String? selectedAMPM;
  String? selectedDuration;

  List<String> hours = List<String>.generate(12, (index) => (index + 1).toString().padLeft(2, '0'));
  List<String> amPm = ['AM', 'PM'];
  List<String> durations = ['30 minutes', '1 hour', '1 hour 30 minutes', '2 hours'];

  void updateHour(String? hour) {
    selectedHour = hour;
    notifyListeners();
  }

  void updateAMPM(String? ampm) {
    selectedAMPM = ampm;
    notifyListeners();
  }

  void updateDuration(String? duration) {
    selectedDuration = duration;
    notifyListeners();
  }

  void clearFields() {
    descriptionController.clear();
    selectedHour = null;
    selectedAMPM = null;
    selectedDuration = null;
    notifyListeners();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }
}
