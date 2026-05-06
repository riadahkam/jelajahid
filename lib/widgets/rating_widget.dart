import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../theme/app_colors.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  final double iconSize;
  final bool showText;

  const RatingWidget({
    super.key,
    required this.rating,
    this.iconSize = 16,
    this.showText = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RatingBarIndicator(
          rating: rating,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: AppColors.star,
          ),
          itemCount: 5,
          itemSize: iconSize,
          direction: Axis.horizontal,
        ),
        if (showText) ...[
          const SizedBox(width: 4),
          Text(
            rating.toString(),
            style: TextStyle(
              fontSize: iconSize * 0.8,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ],
    );
  }
}
