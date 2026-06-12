import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

// Verification Badge Component
class VerificationBadge extends StatelessWidget {
  final String text;

  const VerificationBadge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, color: Colors.white, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Experience Card Component
class ExperienceCard extends StatelessWidget {
  final String hospital;
  final String role;
  final String dateRange;
  final String description;

  const ExperienceCard({
    super.key,
    required this.hospital,
    required this.role,
    required this.dateRange,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hospital,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            role,
            style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.6), fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            dateRange,
            style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.4), fontSize: 10),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.6), fontSize: 12, height: 1.4),
          ),
        ],
      ),
    );
  }
}

// Review Card Component
class ReviewCard extends StatelessWidget {
  final String patientName;
  final String timeAgo;
  final int rating;
  final String review;

  const ReviewCard({
    super.key,
    required this.patientName,
    required this.timeAgo,
    required this.rating,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppTheme.surfaceColor,
                child: Icon(Icons.person, color: AppTheme.textSecondary.withOpacity(0.3)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patientName,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      timeAgo,
                      style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.4), fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: AppTheme.primaryColor.withOpacity(0.6),
                size: 16,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            review,
            style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.6), fontSize: 12, height: 1.4),
          ),
        ],
      ),
    );
  }
}
