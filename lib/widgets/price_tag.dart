import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../theme/app_colors.dart';

class PriceTag extends StatelessWidget {
  final int price;
  final double fontSize;
  final Color? color;

  const PriceTag({
    super.key,
    required this.price,
    this.fontSize = 16,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (price == 0) {
      return Text(
        'Gratis',
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: AppColors.success,
        ),
      );
    }

    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Text(
      formatter.format(price),
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color ?? AppColors.accent,
      ),
    );
  }
}
