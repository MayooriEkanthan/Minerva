import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomSegmentedControl extends StatefulWidget {
  final List<String> options;
  final ValueChanged<int> onChanged;
  final Color? activeColor;

  const CustomSegmentedControl({
    super.key,
    required this.options,
    required this.onChanged,
    this.activeColor,
  });

  @override
  State<CustomSegmentedControl> createState() => _CustomSegmentedControlState();
}

class _CustomSegmentedControlState extends State<CustomSegmentedControl> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: List.generate(widget.options.length, (index) {
          final isSelected = _selectedIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                widget.onChanged(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? (widget.activeColor ?? AppTheme.primaryColor) : Colors.transparent,
                  borderRadius: BorderRadius.circular(28),
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.options[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isSelected ? Colors.white : AppTheme.textSecondary.withOpacity(0.6),
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                        fontSize: 12,
                      ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
