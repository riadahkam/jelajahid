class Booking {
  final String id;
  final String destinationId;
  final String destinationName;
  final String destinationImage;
  final String userName;
  final DateTime date;
  final int numberOfPeople;
  final int totalPrice;
  final String status;
  final DateTime createdAt;

  const Booking({
    required this.id,
    required this.destinationId,
    required this.destinationName,
    required this.destinationImage,
    required this.userName,
    required this.date,
    required this.numberOfPeople,
    required this.totalPrice,
    this.status = 'Confirmed',
    required this.createdAt,
  });
}
