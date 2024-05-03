import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/submit.ticket.controller.dart';

class SupportTicketPage extends StatelessWidget {
  const SupportTicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SupportTicketController>(
      create: (_) => SupportTicketController(),
      child: Consumer<SupportTicketController>(
        builder: (context, controller, _) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Submit Support Ticket"),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: controller.descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'What is going on?',
                        hintText: 'Short Description of what is going on...',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField<String>(
                      value: controller.selectedHour,
                      onChanged: controller.updateHour,
                      items: controller.hours.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: const InputDecoration(labelText: 'Select Hour'),
                    ),
                    DropdownButtonFormField<String>(
                      value: controller.selectedAMPM,
                      onChanged: controller.updateAMPM,
                      items: controller.amPm.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: const InputDecoration(labelText: 'AM/PM'),
                    ),
                    DropdownButtonFormField<String>(
                      value: controller.selectedDuration,
                      onChanged: controller.updateDuration,
                      items: controller.durations.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: const InputDecoration(labelText: 'Add Duration'),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Implement submission logic
                        },
                        child: const Text('Submit Support'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
