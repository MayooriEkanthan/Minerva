import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class CustomCalendarGrid extends StatelessWidget {
  const CustomCalendarGrid({super.key});

  @override
  Widget build(BuildContext context) {
    const daysOfWeek = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
    // Jan 2026 starts on Thursday (index 4)
    const int startDayOffset = 4;
    const int daysInMonth = 31;
    
    // Status maps based on the image
    final periodDays = {5, 6, 7, 8, 9};
    final nextPeriodDays = {12}; // The image shows 12 in light pink, and legend shows pink outline for next period. 
    final fertileDays = {15, 16, 17, 18, 19};

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.surfaceColor, width: 2),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'January ',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textSecondary,
                    ),
              ),
              Text(
                '2026 ',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textSecondary,
                    ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.surfaceColor, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(Icons.chevron_left, size: 16, color: AppTheme.textSecondary),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Days of Week
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: daysOfWeek
                .map((day) => Text(
                      day,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.textSecondary,
                            fontSize: 12,
                          ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 16),
          // Calendar Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: startDayOffset + daysInMonth,
            itemBuilder: (context, index) {
              if (index < startDayOffset) {
                // Previous month days (28, 29, 30, 31)
                final prevMonthDay = 28 + index;
                return Center(
                  child: Text(
                    prevMonthDay.toString(),
                    style: TextStyle(color: AppTheme.textSecondary),
                  ),
                );
              }

              final day = index - startDayOffset + 1;
              bool isPeriod = periodDays.contains(day);
              bool isFertile = fertileDays.contains(day);
              bool isNextPeriod = nextPeriodDays.contains(day);

              BoxDecoration? decoration;
              Color textColor = AppTheme.textSecondary;

              if (isPeriod) {
                decoration = const BoxDecoration(color: AppTheme.primaryColor, shape: BoxShape.circle);
                textColor = Colors.white;
              } else if (isFertile) {
                decoration = const BoxDecoration(color: Colors.lightBlueAccent, shape: BoxShape.circle);
                textColor = Colors.white;
              } else if (isNextPeriod) {
                // The image shows 12 in a light pink box. We'll use a very light pink circle/box
                decoration = BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                );
                textColor = AppTheme.primaryColor;
              }

              return Container(
                decoration: decoration,
                alignment: Alignment.center,
                child: Text(
                  day.toString(),
                  style: TextStyle(color: textColor, fontWeight: decoration != null ? FontWeight.bold : FontWeight.normal),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
