import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/minerva_logo.dart';
import '../../../../core/widgets/custom_segmented_control.dart';
import '../widgets/health_data_card.dart';
import '../widgets/notification_card.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({super.key});

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  int _selectedNotificationTab = 0;

  String _heartRate = '72 bpm';
  String _mood = 'Calm';
  String _sleep = '7.5 hrs';
  String _activity = 'Active';
  String _bloodPressure = '120/80';

  Future<void> _showEditDialog(String title, String currentValue, Function(String) onSave) async {
    final controller = TextEditingController(text: currentValue);
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit $title'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter new value',
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.primaryColor),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: AppTheme.textSecondary)),
            ),
            ElevatedButton(
              onPressed: () {
                onSave(controller.text);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryColor),
              child: const Text('Save', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

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
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('There aren\'t any new notifications yet.'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
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
                context.push('/period-tracker');
              },
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
                            'YOUR HEALTH DATA',
                            style: TextStyle(
                              color: AppTheme.textSecondary.withOpacity(0.8),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 16),
                          GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              HealthDataCard(
                                title: 'Heart Rate',
                                value: _heartRate,
                                icon: Icons.favorite_border,
                                color: Colors.lightBlue,
                                onTap: () => _showEditDialog('Heart Rate', _heartRate, (val) => setState(() => _heartRate = val)),
                              ),
                              HealthDataCard(
                                title: 'Mood',
                                value: _mood,
                                icon: Icons.sentiment_satisfied_alt,
                                color: AppTheme.primaryColor,
                                onTap: () => _showEditDialog('Mood', _mood, (val) => setState(() => _mood = val)),
                              ),
                              HealthDataCard(
                                title: 'Sleep',
                                value: _sleep,
                                icon: Icons.nightlight_round,
                                color: Colors.orangeAccent,
                                onTap: () => _showEditDialog('Sleep', _sleep, (val) => setState(() => _sleep = val)),
                              ),
                              HealthDataCard(
                                title: 'Activity',
                                value: _activity,
                                icon: Icons.sentiment_neutral,
                                color: Colors.deepPurpleAccent,
                                onTap: () => _showEditDialog('Activity', _activity, (val) => setState(() => _activity = val)),
                              ),
                              HealthDataCard(
                                title: 'Blood Pressure',
                                value: _bloodPressure,
                                icon: Icons.water_drop_outlined,
                                color: Colors.greenAccent,
                                onTap: () => _showEditDialog('Blood Pressure', _bloodPressure, (val) => setState(() => _bloodPressure = val)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () => context.push('/analytics'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'See Analytics Dashboard',
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
                    ),
                    const SizedBox(height: 32),
                    
                    // Notifications Section
                    Text(
                      'NOTIFICATIONS',
                      style: TextStyle(
                        color: AppTheme.textSecondary.withOpacity(0.8),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomSegmentedControl(
                      options: const ['All', 'Appointments', 'Consultations'],
                      onChanged: (index) {
                        setState(() {
                          _selectedNotificationTab = index;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    
                    if (_selectedNotificationTab == 0 || _selectedNotificationTab == 1)
                      NotificationCard(
                        title: 'Appointment Confirmed',
                        description: 'Your appointment with Dr. Anya has been confirmed for 2026-06-15.',
                        timestamp: '6/15/2026, 2:00:00 PM',
                        icon: Icons.calendar_today_outlined,
                        onMarkAsRead: () {},
                        onViewDetails: () {},
                        onDelete: () {},
                      ),
                      
                    if (_selectedNotificationTab == 0 || _selectedNotificationTab == 2)
                      NotificationCard(
                        title: 'Consultation Scheduled',
                        description: 'Your voice consultation is scheduled for tomorrow at 10 AM.',
                        timestamp: '6/16/2026, 10:00:00 AM',
                        icon: Icons.chat_bubble_outline,
                        onMarkAsRead: () {},
                        onViewDetails: () {},
                        onDelete: () {},
                      ),
                      
                    if (_selectedNotificationTab == 0)
                      NotificationCard(
                        title: 'Platform Update',
                        description: 'Exciting new features have been added to Minerva! Check them out.',
                        timestamp: '6/17/2026, 11:45:00 AM',
                        icon: Icons.campaign_outlined,
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
