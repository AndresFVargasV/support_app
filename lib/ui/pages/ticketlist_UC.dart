
import 'package:flutter/material.dart';
import '../controller/ticketlist_uc.controller.dart'; // Asegúrate de importar tu controlador

class TicketsPage extends StatelessWidget {
  final TicketsController controller = TicketsController();

  TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tickets"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: FutureBuilder<List<Ticket>>(
        future: controller.fetchTickets(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          var tickets = snapshot.data!;
          return ListView.builder(
            itemCount: tickets.length,
            itemBuilder: (context, index) {
              Ticket ticket = tickets[index];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(ticket.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(ticket.description),
                  trailing: Text("Ticket #: ${ticket.ticketNumber}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
