import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/minerva_logo.dart';
import '../../../patient/presentation/widgets/health_data_card.dart';
import '../widgets/doctor_profile_header.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        elevation: 0,
        title: const Row(
          children: [
            MinervaLogo(size: 32, showText: false),
            SizedBox(width: 8),
            Text(
              'Minerva',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.notifications_none, color: AppTheme.primaryColor),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.calendar_today_outlined, color: AppTheme.primaryColor),
              onPressed: () {
                context.push('/doctor-period-tracker');
              },
            ),
          ),
          const SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Curved pink header
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: const DoctorProfileHeader(),
            ),
            
            // Overlapping content
            Padding(
              padding: const EdgeInsets.only(top: 140),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 80.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            
            const SizedBox(height: 32),
            
            const Text(
              'Your Health Data',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            
            // Reused Patient Health Grid
            SizedBox(
              height: 160,
              child: Row(
                children: [
                  const Expanded(
                    child: HealthDataCard(
                      title: 'Heart Rate',
                    value: '72 bpm',
                    icon: Icons.favorite_border,
                    color: Color(0xFF7B8DFF), // Blue
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: HealthDataCard(
                    title: 'Mood',
                    value: 'Calm',
                    icon: Icons.sentiment_satisfied,
                    color: AppTheme.primaryColor, // Pink
                  ),
                ),
              ],
            ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 160,
              child: Row(
                children: [
                  const Expanded(
                    child: HealthDataCard(
                      title: 'Sleep',
                    value: '7.5 hrs',
                    icon: Icons.nightlight_round,
                    color: Color(0xFFFFB28A), // Orange
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: HealthDataCard(
                    title: 'Activity',
                    value: 'Active',
                    icon: Icons.directions_run,
                    color: Color(0xFFB497FF), // Purple
                  ),
                ),
              ],
            ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 160,
              child: Row(
                children: [
                  const Expanded(
                    child: HealthDataCard(
                      title: 'Blood Pressure',
                    value: '120/80',
                    icon: Icons.water_drop_outlined,
                    color: Color(0xFF4ADE80), // Green
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.push('/doctor-analytics');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primaryColor.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'See Analytics',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ),
            
            const SizedBox(height: 120), // Bottom padding for navbar
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
