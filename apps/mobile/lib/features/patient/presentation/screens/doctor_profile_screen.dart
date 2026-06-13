import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/primary_button.dart';
import '../widgets/doctor_profile_components.dart';

class DoctorProfileScreen extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final int experience;
  final double rating;
  final String reviews;
  final double hourlyRate;

  const DoctorProfileScreen({
    super.key,
    this.doctorName = 'Dr. Anya Sharma',
    this.specialty = 'Gynecologist',
    this.experience = 12,
    this.rating = 4.9,
    this.reviews = '256',
    this.hourlyRate = 1500.0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppTheme.textPrimary),
          onPressed: () => context.pop(),
        ),
        title: Text(
          doctorName,
          style: const TextStyle(color: AppTheme.textSecondary, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Profile Header
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppTheme.surfaceColor,
                    child: Icon(Icons.person, size: 50, color: AppTheme.textSecondary.withOpacity(0.8)),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    doctorName,
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppTheme.textSecondary),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    specialty,
                    style: TextStyle(fontSize: 16, color: AppTheme.textSecondary.withOpacity(0.8)),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$experience years experience',
                        style: TextStyle(fontSize: 14, color: AppTheme.textSecondary.withOpacity(0.8)),
                      ),
                      const SizedBox(width: 8),
                      Text('•', style: TextStyle(color: AppTheme.textSecondary.withOpacity(0.8))),
                      const SizedBox(width: 8),
                      Text(
                        rating.toString(),
                        style: const TextStyle(fontSize: 14, color: AppTheme.primaryColor),
                      ),
                      const SizedBox(width: 2),
                      const Icon(Icons.star_border, color: AppTheme.primaryColor, size: 12),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // 2. Verifications Section
            Text(
              'Doctor Verification',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 22, color: AppTheme.textSecondary),
            ),
            const SizedBox(height: 16),
            VerificationBadge(text: 'Board Certified in $specialty'),
            const VerificationBadge(text: 'Verified Medical License'),
            VerificationBadge(text: '$experience+ Years of Clinical Experience'),
            const SizedBox(height: 16),
            Center(
              child: TextButton.icon(
                onPressed: () => _showCredentialsModal(context),
                icon: const Icon(Icons.verified, color: AppTheme.primaryColor),
                label: const Text(
                  'View Medical Credentials & Proof',
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // 3. Experience Details
            Text(
              'Experience Details',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 22, color: AppTheme.textSecondary),
            ),
            const SizedBox(height: 16),
            ExperienceCard(
              hospital: 'City General Hospital',
              role: 'Senior Consultant $specialty',
              dateRange: '2018 - Present',
              description: 'Leading procedures and patient care, specializing in $specialty.',
            ),
            const ExperienceCard(
              hospital: 'Health Clinic',
              role: 'Associate Doctor',
              dateRange: '2012-2018',
              description: 'Provided comprehensive health services and consultations.',
            ),
            const SizedBox(height: 32),

            // 4. Ratings & Feedback (Collapsible)
            Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                title: Text(
                  'Ratings & Feedback',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 22, color: AppTheme.textSecondary),
                ),
                initiallyExpanded: true,
                children: [
                  Row(
                    children: [
                      Text(
                        'Overall Rating: $rating ',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.textSecondary),
                      ),
                      const Icon(Icons.star_border, color: AppTheme.primaryColor, size: 20),
                      Text(
                        ' ($reviews reviews)',
                        style: TextStyle(fontSize: 16, color: AppTheme.textSecondary.withOpacity(0.8), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const ReviewCard(
                    patientName: 'Anonymous Patient A',
                    timeAgo: '2 days ago',
                    rating: 5,
                    review: 'Incredibly compassionate and made me feel heard. The consultation was thorough and very helpful.',
                  ),
                  const ReviewCard(
                    patientName: 'Anonymous Patient B',
                    timeAgo: '1 week ago',
                    rating: 4,
                    review: 'Professional and knowledgeable. Clearly explained my options. Highly recommend.',
                  ),
                  const ReviewCard(
                    patientName: 'Anonymous Patient C',
                    timeAgo: '3 weeks ago',
                    rating: 5,
                    review: 'A truly exceptional doctor. Approach is kind and empathetic, which is so important for sensitive topics.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // 5. Action Buttons (Only Book Appointment)
            PrimaryButton(
              text: 'Book Appointment & Get Consultation',
              onPressed: () {
                context.push('/payment-checkout', extra: {
                  'name': doctorName,
                  'hourlyRate': hourlyRate,
                });
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showCredentialsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Medical Credentials',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textSecondary,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: AppTheme.textSecondary),
                  onPressed: () => context.pop(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'All documents have been verified by Minerva\'s medical review board.',
              style: TextStyle(color: Colors.grey[800], fontSize: 14),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  _buildDocumentCard('Medical License (Sri Lanka Medical Council)', Icons.badge),
                  const SizedBox(height: 16),
                  _buildDocumentCard('MD in Obstetrics and Gynecology', Icons.school),
                  const SizedBox(height: 16),
                  _buildDocumentCard('Certificate of Good Standing', Icons.assignment_turned_in),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentCard(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppTheme.primaryColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Verified',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.remove_red_eye, color: AppTheme.primaryColor),
        ],
      ),
    );
  }
}
