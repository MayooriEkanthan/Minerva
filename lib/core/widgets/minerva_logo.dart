import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MinervaLogo extends StatelessWidget {
  final double size;
  final bool showText;

  const MinervaLogo({
    super.key,
    this.size = 80.0,
    this.showText = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(
            color: AppTheme.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.monitor_heart_outlined, // Closest material icon to the design
            color: Colors.white,
            size: size * 0.5,
          ),
        ),
        if (showText) ...[
          const SizedBox(height: 12),
          Text(
            'Minerva',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.w800,
                  fontSize: size * 0.35,
                ),
          ),
        ],
      ],
    );
  }
}
