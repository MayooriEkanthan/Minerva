import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/primary_button.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int _rating = 0;
  final Set<String> _selectedChips = {};

  final List<String> _feedbackOptions = [
    'Helpful',
    'Friendly',
    'Clear Explanations',
    'Empathetic',
    'Great Listener',
    'Professional',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Feedback',
          style: TextStyle(color: AppTheme.textSecondary, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        child: Column(
          children: [
            const SizedBox(height: 64),
            Text(
              'How was your consultation?',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 20,
                    color: AppTheme.textSecondary.withOpacity(0.8),
                  ),
            ),
            const SizedBox(height: 24),
            
            // Star Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Icon(
                      index < _rating ? Icons.star : Icons.star_border,
                      size: 40,
                      color: index < _rating ? Colors.grey.shade400 : Colors.grey.shade300, // Matching the light grey in image
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 48),
            
            // Feedback Chips Grid
            Wrap(
              spacing: 12,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: _feedbackOptions.map((option) {
                final isSelected = _selectedChips.contains(option);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        _selectedChips.remove(option);
                      } else {
                        _selectedChips.add(option);
                      }
                    });
                  },
                  child: Container(
                    width: (MediaQuery.of(context).size.width - 48 - 16) / 2, // 2 columns minus padding/spacing
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: isSelected ? AppTheme.primaryColor.withOpacity(0.1) : AppTheme.surfaceColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                      border: isSelected ? Border.all(color: AppTheme.primaryColor.withOpacity(0.3)) : null,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      option,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isSelected ? AppTheme.primaryColor : AppTheme.textSecondary.withOpacity(0.4),
                        fontSize: 12,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            
            const SizedBox(height: 64),
            
            PrimaryButton(
              text: 'Submit Feedback',
              onPressed: () {
                // Submit logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
