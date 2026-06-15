import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/patient_review_card.dart';

class DoctorFeedbackScreen extends StatelessWidget {
  const DoctorFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Feedback & Reviews',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overall Rating Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    'Overall Rating',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '4.4',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF4D8D), // Pink rating color
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) => const Icon(
                      Icons.star,
                      color: Color(0xFFFF4D8D),
                      size: 24,
                    )),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '5 reviews',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Filter Pills
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterPill('Last 7 Days', isActive: true),
                  _buildFilterPill('Last 30 Days'),
                  _buildFilterPill('Last 3 month'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            
            // Positive Traits Chips
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildTraitChip('Great Listener'),
                _buildTraitChip('Clear Explanations'),
                _buildTraitChip('Empathetic Approach'),
                _buildTraitChip('Timely Responses'),
                _buildTraitChip('Effective Treatment'),
              ],
            ),
            const SizedBox(height: 24),
            
            // Monthly Rating Trend Chart
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Monthly Rating Trend',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: CustomPaint(
                      painter: _MockRatingChartPainter(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Patient Reviews Header
            const Text(
              'Patient Reviews',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            
            // List of Reviews
            const PatientReviewCard(
              name: 'Patient Alpha_7',
              date: '2026-06-13',
              rating: 5.0,
              reviewText: 'Dr. Evelyn was incredibly attentive and thorough. Felt very comfortable discussing my concerns. Highly recommended!',
            ),
            const PatientReviewCard(
              name: 'Patient Beta_2',
              date: '2026-06-11',
              rating: 4.0,
              reviewText: 'Good consultation, clear explanations. Just a small delay in starting, but overall a positive experience.',
              initialReply: 'Thank you for your feedback! We are working to minimize any wait times and appreciate your understanding.',
            ),
            const PatientReviewCard(
              name: 'Patient Gamma_9',
              date: '2026-06-08',
              rating: 5.0,
              reviewText: 'Excellent listener and provided clear, actionable advice. Very professional and empathetic.',
            ),
            const PatientReviewCard(
              name: 'Patient Delta_1',
              date: '2026-06-05',
              rating: 3.0,
              reviewText: 'The consultation was okay, but I felt a bit rushed. The advice was generally helpful.',
            ),
            const PatientReviewCard(
              name: 'Patient Epsilon_5',
              date: '2026-06-01',
              rating: 5.0,
              reviewText: 'Outstanding support and a very pleasant experience. Dr. Evelyn truly cares.',
            ),
            
            const SizedBox(height: 120), // Bottom padding
          ],
        ),
      ),
    );
  }

  Widget _buildFilterPill(String text, {bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        boxShadow: isActive ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ] : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
          color: isActive ? AppTheme.textSecondary : AppTheme.textSecondary,
        ),
      ),
    );
  }

  Widget _buildTraitChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// Custom Painter for the mock Rating Trend Chart
class _MockRatingChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFF4D8D) // Pink line
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    
    // Draw the curve (mocking the image shape)
    path.moveTo(0, size.height); // Start at bottom left (4.2 area)
    
    // Control point 1, End point 1 (peak 1)
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.5, size.width * 0.2, size.height * 0.6);
    
    // Dip
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.9, size.width * 0.4, size.height * 0.8);
    
    // High Peak
    path.quadraticBezierTo(size.width * 0.6, 0, size.width * 0.7, size.height * 0.1);
    
    // Downward slope
    path.quadraticBezierTo(size.width * 0.9, size.height * 0.4, size.width, size.height * 0.7);

    canvas.drawPath(path, paint);

    // Draw Y-axis labels
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    void drawText(String text, Offset offset) {
      textPainter.text = TextSpan(
        text: text,
        style: TextStyle(color: Colors.white, fontSize: 10),
      );
      textPainter.layout();
      textPainter.paint(canvas, offset);
    }

    drawText('4.8', const Offset(0, 0));
    drawText('4.5', Offset(0, size.height * 0.5));
    drawText('4.2', Offset(0, size.height - 10));

    // Draw X-axis labels
    drawText('Jan', Offset(0, size.height + 10));
    drawText('Mar', Offset(size.width * 0.3, size.height + 10));
    drawText('May', Offset(size.width * 0.6, size.height + 10));
    drawText('Jul', Offset(size.width - 15, size.height + 10));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
