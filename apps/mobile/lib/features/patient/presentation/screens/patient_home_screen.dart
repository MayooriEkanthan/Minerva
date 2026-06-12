import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/minerva_logo.dart';
import '../../../../core/widgets/custom_segmented_control.dart';
import '../widgets/health_data_card.dart';
import '../widgets/notification_card.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({super.key});

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
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // 1. The large curvy pink header (below the AppBar)
            Container(
              height: 260,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  // Greeting
                  const Text(
                    'Hello,\nMinervaUser',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Description
                  const Text(
                    'This is a safe space where you can talk freely about your health. No one knows who you are. Only care, not judgment.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          
            // 2. The Overlapping Content
            Padding(
              padding: const EdgeInsets.only(top: 200), // Overlaps the bottom of the pink area
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top overlapping card (similar to 'From/To' in ridesync, we use Health Data here)
                    Container(
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Health Data',
                            style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 18, color: AppTheme.textSecondary),
                          ),
                          const SizedBox(height: 16),
                          GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              const HealthDataCard(
                                title: 'Heart Rate',
                                value: '72 bpm',
                                icon: Icons.favorite_border,
                                color: Colors.lightBlue,
                              ),
                              const HealthDataCard(
                                title: 'Mood',
                                value: 'Calm',
                                icon: Icons.sentiment_satisfied_alt,
                                color: AppTheme.primaryColor,
                              ),
                              const HealthDataCard(
                                title: 'Sleep',
                                value: '7.5 hrs',
                                icon: Icons.nightlight_round,
                                color: Colors.orangeAccent,
                              ),
                              const HealthDataCard(
                                title: 'Activity',
                                value: 'Active',
                                icon: Icons.sentiment_neutral,
                                color: Colors.deepPurpleAccent,
                              ),
                              const HealthDataCard(
                                title: 'Blood Pressure',
                                value: '120/80',
                                icon: Icons.water_drop_outlined,
                                color: Colors.greenAccent,
                              ),
                              GestureDetector(
                                onTap: () => context.push('/analytics'),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppTheme.primaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'See Analytics',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Notifications Section
                    Text(
                      'Notifications',
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 18, color: AppTheme.textSecondary),
                    ),
                    const SizedBox(height: 16),
                    CustomSegmentedControl(
                      options: const ['All', 'Appointments', 'Consultations'],
                      onChanged: (index) {},
                    ),
                    const SizedBox(height: 24),
                    NotificationCard(
                      title: 'Platform Update',
                      description: 'Exciting new features have been added to Minerva! Check them out.',
                      timestamp: '7/20/2024, 11:45:00 AM',
                      icon: Icons.campaign_outlined,
                      onMarkAsRead: () {},
                      onViewDetails: () {},
                      onDelete: () {},
                    ),
                    NotificationCard(
                      title: 'Appointment Confirmed',
                      description: 'Your appointment with Dr. Anya has been confirmed for 2024-07-18.',
                      timestamp: '7/18/2024, 2:00:00 PM',
                      icon: Icons.calendar_today_outlined,
                      onMarkAsRead: () {},
                      onViewDetails: () {},
                      onDelete: () {},
                    ),
                    const SizedBox(height: 40),
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
