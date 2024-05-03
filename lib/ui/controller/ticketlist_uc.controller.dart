
class Ticket {
  final String name;
  final String description;
  final String ticketNumber;

  Ticket({required this.name, required this.description, required this.ticketNumber});
}

class TicketsController {
  Future<List<Ticket>> fetchTickets() async {
    // Simula la recuperación de datos de la base de datos
    await Future.delayed(const Duration(seconds: 1)); // Simula un tiempo de carga
    return [
      Ticket(name: "Ticket Name", description: "Streamline customer support with our intuitive Support Ticket app. Easily manage, track...", ticketNumber: "42942424"),
      // Agrega más tickets aquí
    ];
  }
}
