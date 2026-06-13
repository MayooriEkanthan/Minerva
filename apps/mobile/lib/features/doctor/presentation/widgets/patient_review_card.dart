import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class PatientReviewCard extends StatefulWidget {
  final String name;
  final String date;
  final double rating;
  final String reviewText;
  final String? initialReply; // If they already replied

  const PatientReviewCard({
    super.key,
    required this.name,
    required this.date,
    required this.rating,
    required this.reviewText,
    this.initialReply,
  });

  @override
  State<PatientReviewCard> createState() => _PatientReviewCardState();
}

class _PatientReviewCardState extends State<PatientReviewCard> {
  final TextEditingController _replyController = TextEditingController();
  String? _submittedReply;

  @override
  void initState() {
    super.initState();
    _submittedReply = widget.initialReply;
  }

  @override
  void dispose() {
    _replyController.dispose();
    super.dispose();
  }

  void _submitReply() {
    if (_replyController.text.trim().isNotEmpty) {
      setState(() {
        _submittedReply = _replyController.text.trim();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: AppTheme.primaryColorLight,
                child: Icon(Icons.person, color: AppTheme.primaryColor),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  Text(
                    widget.date,
                    style: TextStyle(
                      fontSize: 10,
                      color: AppTheme.textSecondary.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < widget.rating.floor()
                    ? Icons.star
                    : (index < widget.rating ? Icons.star_half : Icons.star_border),
                color: const Color(0xFFFF4D8D), // The pink star color
                size: 16,
              );
            }),
          ),
          const SizedBox(height: 12),
          Text(
            widget.reviewText,
            style: TextStyle(
              fontSize: 12,
              color: AppTheme.textSecondary.withOpacity(0.8),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          
          if (_submittedReply != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.surfaceColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Reply:',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _submittedReply!,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppTheme.textSecondary.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            )
          else
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.surfaceColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _replyController,
                      style: const TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                        hintText: 'Reply to review...',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: AppTheme.textSecondary.withOpacity(0.8),
                        ),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (_) => _submitReply(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _submitReply,
                  child: const Icon(
                    Icons.chat_bubble_outline,
                    color: AppTheme.primaryColor,
                    size: 20,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
