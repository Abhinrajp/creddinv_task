import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PriceText extends StatelessWidget {
  const PriceText(this.amount, {super.key, this.large = false});
  final double amount;
  final bool large;

  @override
  Widget build(BuildContext context) => Text(
        '₹${amount.toStringAsFixed(0)}',
        style: TextStyle(
          color: AppColors.forest,
          fontWeight: FontWeight.w800,
          fontSize: large ? 22 : 16,
          letterSpacing: -.3,
        ),
      );
}
