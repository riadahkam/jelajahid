import 'package:flutter/material.dart';

class Mood {
  final String id;
  final String name;
  final String emoji;
  final String description;
  final String tip;
  final Color color;
  final Color colorDark;
  final IconData icon;

  const Mood({
    required this.id,
    required this.name,
    required this.emoji,
    required this.description,
    required this.tip,
    required this.color,
    required this.colorDark,
    required this.icon,
  });
}

class MoodData {
  static const List<Mood> allMoods = [
    Mood(
      id: 'galau',
      name: 'Galau',
      emoji: '😔',
      description: 'Perasaan campur aduk, butuh tempat untuk merenung',
      tip: 'Tempat-tempat dengan pemandangan luas dan suasana tenang bisa membantu menjernihkan pikiran.',
      color: Color(0xFF6C63FF),
      colorDark: Color(0xFF3D37B0),
      icon: Icons.cloud,
    ),
    Mood(
      id: 'bahagia',
      name: 'Bahagia',
      emoji: '😄',
      description: 'Penuh kebahagiaan, ingin merayakan momen indah',
      tip: 'Rayakan dengan petualangan seru di tempat-tempat menakjubkan!',
      color: Color(0xFFFFB830),
      colorDark: Color(0xFFCC8F00),
      icon: Icons.sunny,
    ),
    Mood(
      id: 'tenang',
      name: 'Tenang',
      emoji: '😌',
      description: 'Ingin kedamaian dan ketenangan batin',
      tip: 'Tempat-tempat alami dengan suasana hening cocok untuk meditasi dan relaksasi.',
      color: Color(0xFF4ECDC4),
      colorDark: Color(0xFF2E9E97),
      icon: Icons.spa,
    ),
    Mood(
      id: 'romantis',
      name: 'Romantis',
      emoji: '🥰',
      description: 'Cinta di udara, momen berdua yang spesial',
      tip: 'Pantai saat sunset atau tempat dengan pemandangan menakjubkan sempurna untuk berdua.',
      color: Color(0xFFFF6B8A),
      colorDark: Color(0xFFCC3D5C),
      icon: Icons.favorite,
    ),
    Mood(
      id: 'petualang',
      name: 'Petualang',
      emoji: '🤩',
      description: 'Semangat membara, siap untuk tantangan baru',
      tip: 'Gunung, hutan, dan lautan menunggumu untuk ditaklukkan!',
      color: Color(0xFFFF6B35),
      colorDark: Color(0xFFCC4A14),
      icon: Icons.explore,
    ),
    Mood(
      id: 'stres',
      name: 'Stres',
      emoji: '😩',
      description: 'Pikiran penat, butuh pelarian dari rutinitas',
      tip: 'Pergi ke alam terbuka dan hirup udara segar. Alam adalah obat terbaik untuk stres.',
      color: Color(0xFFE74C3C),
      colorDark: Color(0xFFB32E1F),
      icon: Icons.battery_alert,
    ),
    Mood(
      id: 'kesepian',
      name: 'Kesepian',
      emoji: '🥺',
      description: 'Merasa sendiri, butuh koneksi dengan sekitar',
      tip: 'Kunjungi tempat budaya atau wisata populer untuk bertemu orang baru dan mendapat perspektif baru.',
      color: Color(0xFF9B59B6),
      colorDark: Color(0xFF7A3F91),
      icon: Icons.person_outline,
    ),
    Mood(
      id: 'bersyukur',
      name: 'Bersyukur',
      emoji: '🙏',
      description: 'Penuh rasa syukur, ingin menikmati keindahan hidup',
      tip: 'Nikmati keindahan alam Indonesia yang luar biasa sebagai wujud syukur.',
      color: Color(0xFF27AE60),
      colorDark: Color(0xFF1E8C4D),
      icon: Icons.auto_awesome,
    ),
  ];
}
