import 'package:flutter/material.dart';
import '../controller/dashboard_uc.controller.dart';

class DashboardPage extends StatelessWidget {
  final DashboardController controller = DashboardController();

  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Good Morning,',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Summary of your weekly brews',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DashboardButton(
                    label: 'Supports', onPressed: controller.onSupportsPressed),
                const SizedBox(width: 10),
                DashboardButton(
                    label: 'Clients', onPressed: controller.onClientsPressed),
                const SizedBox(width: 10),
                DashboardButton(
                    label: 'Tickets', onPressed: controller.onTicketsPressed),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const DashboardButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
