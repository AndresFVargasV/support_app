import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/ticketllist_us.controller.dart'; // Ajusta el path de importación basado en la estructura de tu proyecto

class MyTicketsPage extends StatelessWidget {
  const MyTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TicketController>(
      create: (_) => TicketController(),
      child: Consumer<TicketController>(
        builder: (context, controller, _) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("My Tickets"),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 25.0),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 81, 146, 179),
                      borderRadius: BorderRadius.circular(4.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ]),
                  child: TextButton(
                    onPressed: () {
                      // Lógica para agregar nuevo ticket
                    },
                    child: const Text(
                      'Agregar Ticket',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
              backgroundColor: Colors.blueGrey, // Ajusta el color del AppBar
            ),
            body: ListView.builder(
              itemCount: controller.tickets.length,
              itemBuilder: (context, index) {
                var ticket = controller.tickets[index];
                return TicketCard(
                  ticketName: ticket.name,
                  ticketNumber: ticket.ticketNumber,
                  status: ticket.status,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class TicketCard extends StatelessWidget {
  final String ticketName;
  final String ticketNumber;
  final String status;

  const TicketCard({
    Key? key,
    required this.ticketName,
    required this.ticketNumber,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: ListTile(
        title: Text(
          ticketName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Ticket #: $ticketNumber'),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          decoration: BoxDecoration(
            color: status == 'Pending' ? Colors.orange : Colors.green,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            status,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
