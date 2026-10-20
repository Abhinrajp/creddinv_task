import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProductPhoto extends StatelessWidget {
  const ProductPhoto({super.key, required this.url, this.fit = BoxFit.cover});
  final String url;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) => Image.network(
        url,
        fit: fit,
        errorBuilder: (_, __, ___) => Container(
          color: AppColors.blush,
          alignment: Alignment.center,
          child: const Icon(Icons.checkroom_rounded, size: 42, color: AppColors.forest),
        ),
      );
}
