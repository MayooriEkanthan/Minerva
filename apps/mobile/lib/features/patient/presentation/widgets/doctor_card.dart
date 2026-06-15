import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final double rating;
  final String reviews;
  final String hourlyRate;
  final VoidCallback onBook;

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.reviews,
    required this.hourlyRate,
    required this.onBook,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Image Placeholder
          CircleAvatar(
            radius: 36,
            backgroundColor: AppTheme.surfaceColor,
            child: Icon(Icons.person, size: 40, color: AppTheme.textSecondary),
          ),
          const SizedBox(height: 12),
          
          // Name
          Text(
            name,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          
          // Specialty Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              specialty,
              style: const TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 8),
          
          // Rating & Reviews
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star_border, color: Colors.deepPurpleAccent.withOpacity(0.5), size: 14),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  '$rating ($reviews Reviews)',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 12,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          // Hourly Rate
          Text(
            hourlyRate,
            style: const TextStyle(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          
          // Book Button
          SizedBox(
            width: double.infinity,
            height: 32,
            child: ElevatedButton(
              onPressed: onBook,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor.withOpacity(0.8),
                elevation: 0,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Book Appointment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
