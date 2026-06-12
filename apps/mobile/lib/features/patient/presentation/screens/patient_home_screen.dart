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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 200,
        leading: const Padding(
          padding: EdgeInsets.only(left: 24.0),
          child: Row(
            children: [
              MinervaLogo(size: 32, showText: false),
              SizedBox(width: 8),
              Text(
                'MinervaUser123',
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 16),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppTheme.textPrimary),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today_outlined, color: AppTheme.primaryColor),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card
            Container(
              padding: const EdgeInsets.all(24.0),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to Minerva!',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This is a safe space where you can talk freely about your health. No one knows who you are. Only care, not judgment.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textSecondary,
                          height: 1.5,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Health Data Section
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
                      borderRadius: BorderRadius.circular(50),
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
            NotificationCard(
              title: 'Consultation Summary Available',
              description: 'Your summary for the consultation on 2024-07-10 is now available.',
              timestamp: '7/10/2024, 4:00:00 PM',
              icon: Icons.chat_bubble_outline,
              onMarkAsRead: () {},
              onViewDetails: () {},
              onDelete: () {},
            ),
          ],
        ),
      ),
    );
  }
}
