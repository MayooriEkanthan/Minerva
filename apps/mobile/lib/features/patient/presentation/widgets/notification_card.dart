import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String timestamp;
  final IconData icon;
  final VoidCallback onMarkAsRead;
  final VoidCallback onViewDetails;
  final VoidCallback onDelete;

  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.icon,
    required this.onMarkAsRead,
    required this.onViewDetails,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: AppTheme.primaryColor, size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.textSecondary.withOpacity(0.8),
                            height: 1.4,
                            fontSize: 13,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      timestamp,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 12,
                            color: AppTheme.textSecondary.withOpacity(0.8),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildActionButton(context, 'Mark as Read', onMarkAsRead, isPrimary: false),
              const SizedBox(width: 8),
              _buildActionButton(context, 'View Details', onViewDetails, isPrimary: false),
              const SizedBox(width: 8),
              _buildActionButton(context, 'Delete', onDelete, isPrimary: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String text, VoidCallback onPressed, {required bool isPrimary}) {
    return Expanded(
      child: SizedBox(
        height: 36,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isPrimary ? AppTheme.primaryColor : AppTheme.surfaceColor,
            foregroundColor: isPrimary ? Colors.white : AppTheme.textSecondary,
            elevation: 0,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
