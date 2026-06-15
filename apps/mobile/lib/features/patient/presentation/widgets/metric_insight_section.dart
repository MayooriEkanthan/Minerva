import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class MetricInsightSection extends StatelessWidget {
  final String insightText;
  final List<InsightTip> tips;
  final String summaryValue;
  final Color color;

  const MetricInsightSection({
    super.key,
    required this.insightText,
    required this.tips,
    required this.summaryValue,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          insightText,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.textSecondary,
                height: 1.5,
              ),
        ),
        const SizedBox(height: 24),
        ...tips.map((tip) => _buildTipItem(context, tip)),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              summaryValue,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'See Details',
            style: TextStyle(
              color: color.withOpacity(0.7),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTipItem(BuildContext context, InsightTip tip) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(tip.icon, color: color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (tip.title != null) ...[
                  Text(
                    tip.title!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textSecondary,
                        ),
                  ),
                  const SizedBox(height: 4),
                ],
                Text(
                  tip.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.textSecondary,
                        height: 1.4,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InsightTip {
  final IconData icon;
  final String? title;
  final String description;

  InsightTip({
    required this.icon,
    this.title,
    required this.description,
  });
}
