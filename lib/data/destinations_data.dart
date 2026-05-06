import '../models/destination.dart';

class DestinationsData {
  static const List<Destination> allDestinations = [
    Destination(
      id: '1',
      name: 'Pantai Kuta',
      location: 'Bali, Indonesia',
      description: 'Pantai paling ikonik di Bali dengan pemandangan matahari terbenam yang memukau dan ombak yang cocok untuk berselancar.',
      imageUrl: 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?auto=format&fit=crop&w=800&q=80',
      rating: 4.8,
      price: 0,
      category: 'Pantai',
      galleries: [
        'https://images.unsplash.com/photo-1539367628448-4bc5c9d171c8?auto=format&fit=crop&w=800&q=80',
        'https://images.unsplash.com/photo-1518548419970-58e3b4079ab2?auto=format&fit=crop&w=800&q=80',
      ],
      highlights: ['Sunset View', 'Surfing', 'Shopping'],
    ),
    Destination(
      id: '2',
      name: 'Raja Ampat',
      location: 'Papua Barat, Indonesia',
      description: 'Surga bawah laut dengan keanekaragaman hayati laut tertinggi di dunia. Gugusan pulau karst yang menakjubkan.',
      imageUrl: 'https://images.unsplash.com/photo-1516690561799-46d8f74f9abf?auto=format&fit=crop&w=800&q=80',
      rating: 4.9,
      price: 15000000,
      category: 'Pantai',
      galleries: [
        'https://images.unsplash.com/photo-1544644181-1484b3fdfc62?auto=format&fit=crop&w=800&q=80',
      ],
      highlights: ['Diving', 'Snorkeling', 'Island Hopping'],
    ),
    Destination(
      id: '3',
      name: 'Candi Borobudur',
      location: 'Magelang, Jawa Tengah',
      description: 'Candi Budha terbesar di dunia dan salah satu monumen Budha terbesar, merupakan situs warisan dunia UNESCO.',
      imageUrl: 'https://images.unsplash.com/photo-1588668214407-6ea9a6d7c26e?auto=format&fit=crop&w=800&q=80',
      rating: 4.7,
      price: 50000,
      category: 'Budaya',
      highlights: ['Historical', 'Sunrise', 'Architecture'],
    ),
    Destination(
      id: '4',
      name: 'Gunung Bromo',
      location: 'Jawa Timur, Indonesia',
      description: 'Gunung berapi aktif yang terkenal dengan kawahnya yang megah dan pemandangan matahari terbit yang dramatis.',
      imageUrl: 'https://images.unsplash.com/photo-1588668214407-6ea9a6d7c26e?auto=format&fit=crop&w=800&q=80', // Replace with proper bromo image
      rating: 4.8,
      price: 220000,
      category: 'Gunung',
      highlights: ['Hiking', 'Sunrise', 'Jeep Tour'],
    ),
    Destination(
      id: '5',
      name: 'Labuan Bajo',
      location: 'Nusa Tenggara Timur',
      description: 'Gerbang menuju Taman Nasional Komodo, menawarkan pemandangan pulau-pulau yang indah dan kesempatan melihat Komodo.',
      imageUrl: 'https://images.unsplash.com/photo-1516690561799-46d8f74f9abf?auto=format&fit=crop&w=800&q=80', // Replace with proper labuan bajo image
      rating: 4.9,
      price: 5000000,
      category: 'Pantai',
      highlights: ['Komodo Dragon', 'Padar Island', 'Pink Beach'],
    ),
    Destination(
      id: '6',
      name: 'Danau Toba',
      location: 'Sumatera Utara',
      description: 'Danau vulkanik terbesar di dunia dengan Pulau Samosir di tengahnya. Menawarkan udara sejuk dan pemandangan pegunungan.',
      imageUrl: 'https://images.unsplash.com/photo-1626305141029-760361664c8d?auto=format&fit=crop&w=800&q=80',
      rating: 4.6,
      price: 150000,
      category: 'Danau',
      highlights: ['Culture', 'Boating', 'Relaxing'],
    ),
  ];
}
