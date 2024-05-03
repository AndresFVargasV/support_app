import 'package:flutter/material.dart';

class Ticket {
  final String name;
  final String description;
  final String status;
  final String ticketNumber;

  Ticket({required this.name, required this.description, required this.status, required this.ticketNumber});
}

class TicketController with ChangeNotifier {
  List<Ticket> tickets = [
    Ticket(
      name: 'Ticket Name',
      description: 'Streamline customer support with our intuitive Support Ticket app. Easily manage, track...',
      status: 'Pending',
      ticketNumber: '42942424'
    ),
    // Add more tickets here
  ];

  // Add methods to handle business logic, such as adding, removing, or updating tickets
}
