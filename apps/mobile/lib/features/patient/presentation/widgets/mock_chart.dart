import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class MockChart extends StatelessWidget {
  final List<double> normalizedData;
  final Color color;
  final bool isBarChart;
  final List<String> labels;

  const MockChart({
    super.key,
    required this.normalizedData,
    required this.color,
    this.isBarChart = false,
    this.labels = const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          width: double.infinity,
          child: CustomPaint(
            painter: _ChartPainter(
              data: normalizedData,
              color: color,
              isBarChart: isBarChart,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: labels
              .map((label) => Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.textSecondary,
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class _ChartPainter extends CustomPainter {
  final List<double> data;
  final Color color;
  final bool isBarChart;

  _ChartPainter({
    required this.data,
    required this.color,
    required this.isBarChart,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = isBarChart ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final stepX = size.width / (data.length - 1);
    
    if (isBarChart) {
      final barWidth = stepX * 0.6;
      for (int i = 0; i < data.length; i++) {
        final x = i * stepX;
        final y = size.height - (data[i] * size.height);
        
        final rect = RRect.fromRectAndRadius(
          Rect.fromLTWH(x - (barWidth / 2), y, barWidth, size.height - y),
          const Radius.circular(4),
        );
        canvas.drawRRect(rect, paint);
      }
    } else {
      final path = Path();
      
      for (int i = 0; i < data.length; i++) {
        final x = i * stepX;
        final y = size.height - (data[i] * size.height);
        
        if (i == 0) {
          path.moveTo(x, y);
        } else {
          // Add a simple bezier curve for smoothness
          final prevX = (i - 1) * stepX;
          final prevY = size.height - (data[i - 1] * size.height);
          final controlPointX = prevX + (x - prevX) / 2;
          
          path.cubicTo(controlPointX, prevY, controlPointX, y, x, y);
        }
        
        // Draw little dot on data points
        canvas.drawCircle(Offset(x, y), 4, Paint()..color = color..style = PaintingStyle.fill);
      }
      
      canvas.drawPath(path, paint);
      
      // Draw light gradient under line chart
      final gradientPaint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color.withOpacity(0.3), color.withOpacity(0.0)],
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
        ..style = PaintingStyle.fill;
        
      final fillPath = Path.from(path)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..close();
        
      canvas.drawPath(fillPath, gradientPaint);
    }
    
    // Draw horizontal dashed guide lines
    final guidePaint = Paint()
      ..color = Color(0xFF424242)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
      
    for (int i = 0; i < 4; i++) {
      final y = size.height * (i / 3);
      _drawDashedLine(canvas, Offset(0, y), Offset(size.width, y), guidePaint);
    }
  }
  
  void _drawDashedLine(Canvas canvas, Offset p1, Offset p2, Paint paint) {
    const int dashWidth = 5;
    const int dashSpace = 5;
    double startX = p1.dx;
    while (startX < p2.dx) {
      canvas.drawLine(Offset(startX, p1.dy), Offset(startX + dashWidth, p2.dy), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
